#!/bin/bash

#echo "************************************************"
#echo "***                                          ***"
#echo "***          Enter your choice               ***"
#echo "***                                          ***"
#echo "************************************************"


#echo "1 For Fresh Install Enter "
#echo "2 For Upgrade "
#echo "3 For Uninstall "
#echo "4) For Uninstall with Delete App Folder"


#********** To know if application is already installed **********

checkalreadyinstalled()
{
echo
echo "Checking is App already installed"
echo
DEVICES=`adb devices | tail -n +2 | cut -f1`
echo "List of devices attached" $DEVICES
echo
for Device in $DEVICES
do
echo -e "App details for Device:" $Device

CHECK=`adb -s $Device shell pm list packages | grep com.bsb.hike`
echo $CHECK

APP_VERSION=`adb -s $Device shell dumpsys package com.bsb.hike | grep versionName`
echo $APP_VERSION
done

}


#********** Install the apk **********
installapp()
{
DEVICES=`adb devices | tail -n +2 | cut -f1`
echo $DEVICES
for Device in $DEVICES
do
echo $Device
INSTALL="adb -s $Device install $1"
echo $INSTALL
${INSTALL}
done
}


#********** Upgrade the apk **********
upgrade()
{
DEVICES=`adb devices | tail -n +2 | cut -f1`
echo $DEVICES
for Device in $DEVICES
do
#echo $Device
INSTALL="adb -s $Device install -r $1"
#echo $INSTALL
${INSTALL}
done
}


#********** Uninstall the apk **********
uninstallapp()
{
DEVICES=`adb devices | tail -n +2 | cut -f1`
for Device in $DEVICES
do
UNINSTALL="adb -s $Device uninstall com.bsb.hike $1"
${UNINSTALL}
done
}


deleteAppfolder()
{
uninstallapp
DEVICES=`adb devices | tail -n +2 | cut -f1`
for device in $DEVICES
do
DELETE_FOLDER="adb shell rm -r /sdcard/Hike"
${DELETE_FOLDER}
done

}

getlistofDevices()
{
DEVICES="adb devices | tail -n +2 | cut -f1"
echo "List of Attached Devices $DEVICES"
}

getdevicedpi()
{

DEVICES=`adb devices | tail -n +2 | cut -f1`
#echo "List of devices attached" $DEVICES
echo
for Device in $DEVICES
do
echo "DPI of Device:" $Device

devicedpi=`adb -s $Device shell getprop ro.sf.lcd_density`
echo $devicedpi
done
}

getdate()
{
date
}


checkalreadyinstalled



chooseoption()
{
echo
echo "************************************************"
echo "***                                          ***"
echo "***          Enter your choice               ***"
echo "***                                          ***"
echo "************************************************"

echo "1 For Fresh Install Enter "
echo "2 For Upgrade "
echo "3 For Uninstall "

#echo "DPI of Connected Device: $(getdevicedpi)"

#echo "To know if application is already installed: $(checkalreadyinstalled)"

}

read_options()
{
read -p "Enter Your Option : " option
case $option in

1 ) read -p "Build Path :" build
installapp $build

;;

2 ) read -p "Build Path :" build
upgrade $build

;;

3 ) uninstallapp

;;

*) echo "Please Enter a Valid option  ";;

esac

}

while true
do
chooseoption
read_options
done






