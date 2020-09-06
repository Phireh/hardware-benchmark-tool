#!/bin/bash
secs=5
while [ $secs -gt 0 ]
do
printf "\r\033[KStarting benchmark in %.d seconds " $((secs--))
sleep 1
done
echo
sudo mount -o remount,size=2G /run/archiso/cowspace
# Make sure that SMT is actually enabled/disabled
grep nosmt /proc/cmdline && grep -v notsupported /sys/devices/system/cpu/smt/control && echo off | sudo tee /sys/devices/system/cpu/smt/control > /dev/null
grep -v nosmt /proc/cmdline && grep -v notsupported /sys/devices/system/cpu/smt/control && echo on | sudo tee /sys/devices/system/cpu/smt/control > /dev/null
/home/benchmark/kcbench --detailedresults -j $(nproc) -s /home/benchmark/linux-5.8.5 -i 1 | tee benchmark.out
