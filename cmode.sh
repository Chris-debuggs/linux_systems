#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
	echo "Fucking Sudo it"
	exit 1
fi

GOV_PATH="/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"

if [ "$1" == "Boost" ]; then
	echo "Boosting"
	for cpu_gov in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; do
		echo "performance">"$cpu_gov"
	done
	echo "Boosted"
elif [ "$1" == "Save" ]; then
	echo "Killing battery consumption"
	for cpu_gov in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor ; do
		echo "powersave">"$cpu_gov"
	done
	echo "Saving battery on"
else
	echo "Nigga wtf"
	exit
fi
