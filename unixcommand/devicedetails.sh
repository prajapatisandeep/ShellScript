#!/bin/bash

deviceproperties()
{
OEM=`adb shell getprop ro.product.manufacturer`
echo "Manufacturer:" $OEM

ModelName=`adb shell getprop ro.product.model`
echo "Model:" $ModelName

Android_SDK=`adb shell getprop ro.build.version.sdk`
echo "Device Android SDK:" $Android_SDK

Density=`adb shell getprop ro.sf.lcd_density`
echo "DPI:" $Density

OSVersion=`adb shell getprop ro.build.version.release`
echo "OS Version:" $OSVersion

Build_Version=`adb shell dumpsys package com.bsb.hike | grep versionName`
echo "Build:" $Build_Version

Build_versionCode=`adb shell dumpsys package com.bsb.hike | grep versionCode | awk '{print $2}'`
echo "TargetSDK:" $Build_versionCode
#NetworkType=`adb shell getprop gsm.network.type`
#echo "Network :" $NetworkType
echo "Environment:"
echo "Network:"
}

echo
echo "*Device Details:*"
deviceproperties
echo

