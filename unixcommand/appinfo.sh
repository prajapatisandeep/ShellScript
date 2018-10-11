#!/bin/bash

#versionName=`adb shell dumpsys package com.bsb.hike | grep versionName`
appVersionName=`adb shell dumpsys package com.bsb.hike | grep versionName | cut -d = -f2`
echo "App Version : "$appVersionName

#versionCode=`adb shell dumpsys package com.bsb.hike | grep versionCode`
appVersionCode=`adb shell dumpsys package com.bsb.hike | grep versionCode | cut -d = -f2 | cut -d " " -f1`
echo "App Version Code : "$appVersionCode

