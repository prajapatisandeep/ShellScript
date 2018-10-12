echo "************************************************"
echo "***                                          ***"
echo "***      Pull file /data/anr/traces.txt      ***"
echo "***                                          ***"
echo "************************************************"

adb_home="$(which adb)"
#echo $adb_home

for line in `("$adb_home" devices | grep -v "List"  | awk '{print $1}')`;
do
device=`echo $line | awk '{print $1}'`
echo "Connected Device : " $device
adb -s $device pull "/data/anr/traces.txt" ${HOME}/$device.txt
done


