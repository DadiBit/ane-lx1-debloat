#!/bin/bash

skipped="\e[34mskipped\e[0m" # already uninstalled
success="\e[32msuccess\e[0m" # fully uninstalled (requires root for most apps)
partial="\e[33mpartial\e[0m" # uninstalled just for user 0 (works without root for "system" apps)
failure="\e[31mfailure\e[0m" # either not uninstallable or already uninstalled

date > debloat.log

installed_apps=`adb shell pm list packages | cut -d ':' -f 2-`
echo "> Installed apps:"

for installed_app in $installed_apps; do
    echo "- $installed_app"
done

apps=`cat list.csv | cut -d ',' -f 1`
for app in $apps; do
    
    echo -n "> Uninstalling $app: "
    
    # guard to check if app is already uninstalled
    if ! echo "$installed_apps" | grep -qx "$app"; then
    	echo -e $skipped
    	continue
    fi
    
    echo -e $success
    continue

    # try to fully uninstall the app 
    adb shell pm uninstall $app &>> debloat.log
    if [ $? == 0 ]; then
        echo -e $success
        continue
    fi
    
    # if not fully uninstalled remove it just for the user, better then nothing
    adb shell pm uninstall -k --user 0 $app &>> debloat.log
    [ $? == 0 ] && echo -e $partial || echo -e $failure
    
done
