### Automatic script

1. Remove from `list.csv` apps that you do not wish to be deleted.

2. Run the script with `./debloat.sh`.

> Note: the script tries to remove the app only if it's installed, plus it always tries to use root for a full uninstall.

### Manual uninstall (no root required)

 1. Connect device with adb
 
 2. Open the app you want to uninstall
 
 3. Run:
 ```
 $ adb shell dumpsys window windows | grep -i "mCurrentFocus"
 mCurrentFocus=Window{4f865b3 u0 com.huawei.gamebox/com.huawei.gamebox.GameBoxActivity}
 ```
 
 4. Replace the package name in the following command (`com.huawei.gamebox`) 
 ```
 $ adb shell pm uninstall -k --user 0 com.huawei.gamebox
 ```
 
 5. Keep a list of apps you succesfully uninstalled, eg:
   - com.huawei.gamebox
   - com.huawei.hwsearch
   - com.huawei.hiassistantoversea
   - com.google.android.youtube
   - com.huawei.hwread.dz (books)
   - com.huawei.phoneservice
   - com.android.mediacenter
   - com.huawei.mycenter
   - com.huawei.browser
   - com.huawei.appmarket
   - com.touchtype.swiftkey
   - com.google.android.videos
   - com.huawei.welinknow
   - com.huawei.search (AI search)
   - com.huawei.intelligent (assistant today)
   - com.huawei.hiaction
   - com.huawei.hitouch
   - com.huawei.KoBackup
   - com.huawei.hicloud
   - com.huawei.hifolder (app provider)
   - com.huawei.vassistant
   - com.google.android.music
   - com.google.android.apps.tachyon (meet/duo)
   - com.android.email
   
 6. If you want to reinstall any package just run:
 ```
 $ adb shell cmd package install-existing com.huawei.gamebox
 Package com.huawei.gamebox installed for user: 0
 ```
 
### Sources

  - Personal research on my rooted ANE-LX1 with KernelSU and stock ROM
  - https://xdaforums.com/t/guide-list-of-bloatware-on-emui-safe-to-remove.3700814/
  - https://docs.google.com/spreadsheets/d/1UA_vrx_9x7vCD3oaSt4hYxmNXZilJcNauOFPn8T2z_g/edit#gid=0
