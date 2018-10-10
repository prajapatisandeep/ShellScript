
devicesattached(){
OEM=`adb shell getprop ro.product.manufacturer`
echo "Device:" $OEM
}

connectdevice(){
#adb tcpip 5555
IP_ADDRESS = adb shell ip route | awk '{print $9}'
echo "IP_ADDRESS"
}

devicesattached()
connectdevice()