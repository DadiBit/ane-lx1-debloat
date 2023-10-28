#!/bin/bash
adb shell dumpsys window windows | grep -i "mCurrentFocus"
