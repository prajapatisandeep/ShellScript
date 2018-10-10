#!/bin/bash

versionName=`adb shell dumpsys package com.bsb.hike | grep versionName`
echo "==="$versionName
versionCode=`adb shell dumpsys package com.bsb.hike | grep versionCode`
echo "==="$versionCode
