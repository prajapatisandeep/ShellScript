#!/bin/bash

#author: Sandeep Prajapati <sandeepp@hike.in> <androidUAT@hike.in>
#Script to check download size of all 5 variants


echo
echo "************************************************"
echo "***                                          ***"
echo "***          APK Analyzer                    ***"
echo "***                                          ***"
echo "************************************************"
echo


read -p "Enter Universal apk: " universal
read -p "Enter hdpi apk: " hdpi
read -p "Enter xhdpi apk: " xhdpi
read -p "Enter xxhdpi apk: " xxhdpi
read -p "Enter xxxhdpi apk: " xxxhdpi

download_file_size()
{

#Universal
universal_download_size=$($ANDROID_HOME/tools/bin/apkanalyzer -h apk download-size $universal)
echo "Universal APK Size: " $universal_download_size

#hdpi
hdpi_download_size=$($ANDROID_HOME/tools/bin/apkanalyzer -h apk download-size $hdpi)
echo "HDPI APK Size: " $hdpi_download_size

#xhdpi
xhdpi_download_size=$($ANDROID_HOME/tools/bin/apkanalyzer -h apk download-size $xhdpi)
echo "XHDPI APK Size: " $xhdpi_download_size

#xxhdpi
xxhdpi_download_size=$($ANDROID_HOME/tools/bin/apkanalyzer -h apk download-size $xxhdpi)
echo "XXHDPI APK Size: " $xxhdpi_download_size

#xxxhdpi
xxxhdpi_download_size=$($ANDROID_HOME/tools/bin/apkanalyzer -h apk download-size $xxxhdpi)
echo "XXXHDPI APK Size: " $xxxhdpi_download_size
}




#analyze_apk()
#{
#echo " "
#}

echo "********************** Apk Size **************************"

download_file_size

echo "**********************************************************"