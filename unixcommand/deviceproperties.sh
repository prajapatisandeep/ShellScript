#!/bin/bash


isWiFiEnabled=`adb shell dumpsys wifi | grep 'Wi-Fi is' | tail -n+1 | cut -d " " -f 3`
#echo $isWiFiEnabled

netWorkType=`adb shell getprop gsm.network.type | tail -n+1 | cut -d , -f1`
#echo $netWorkType

#Manufacturer
OEM=`adb shell getprop ro.product.manufacturer`
#Model
ModelName=`adb shell getprop ro.product.model`
#Device Android SDK
Android_SDK=`adb shell getprop ro.build.version.sdk`
#DPI
Density=`adb shell getprop ro.sf.lcd_density`
#OS Version
OSVersion=`adb shell getprop ro.build.version.release`
#versionName
App_Version=`adb shell dumpsys package com.bsb.hike | grep versionName | cut -d = -f2`
#Build_versionCode=`adb shell dumpsys package com.bsb.hike | grep versionCode | awk '{print $2}'`
#versionCode
Build_versionCode=`adb shell dumpsys package com.bsb.hike | grep versionCode | cut -d = -f2 | cut -d " " -f1`





#To get Network Type (2G,3G,4G,Wi-Fi)
isDeviceConnectedWith()
{


if [[ $isWiFiEnabled = 'enabled' ]]; then
  echo "Network: Wi-Fi"

elif [[ $netWorkType = 'LTE' ]]; then
  echo "Network: LTE"

elif [[ $netWorkType = 'HSPAP' ]]; then
  echo "Network: 3G"

elif [[ $netWorkType = 'HSPA' ]]; then
  echo "Network: 3G"

elif [[ $netWorkType = 'EDGE' ]]; then
  echo "Network: 2G"

else
  echo "Network: "
fi



}


deviceproperties()
{
echo "Manufacturer:" $OEM
echo "Model:" $ModelName
echo "Device Android SDK:" $Android_SDK
echo "DPI:" $Density
echo "OS Version:" $OSVersion
echo "App Version:" $App_Version
echo "App Version Code:" $Build_versionCode
isDeviceConnectedWith
echo "Environment:"
}


inputFields()
{
echo
echo "*Pre-Requisites:*"
echo
echo "*Repro Steps:*"
echo
echo "*Actual Behaviour:*"
echo
echo "*Expected Behaviour:*"
echo
}

echo "*Details:*"
deviceproperties
inputFields