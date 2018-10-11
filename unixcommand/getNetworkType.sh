#!/bin/bash

isWiFiEnabled=`adb shell dumpsys wifi | grep 'Wi-Fi is' | tail -n+1 | cut -d " " -f 3`
#echo $isWiFiEnabled

netWorkType=`adb shell getprop gsm.network.type | tail -n+1 | cut -d , -f1`
#echo $netWorkType

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


isDeviceConnectedWith





# isDevicesupportdualsim
# ifdevicessupportsdualsimcheck

