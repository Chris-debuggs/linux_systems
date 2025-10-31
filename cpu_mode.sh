#!/bin/bash

GOV_PATH="/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"

if [ "$1" == "Boost" ]; then
	echo "Boosting"
	echo performance | sudo tee "$GOV_PATH" >/dev/null
	echo "Boosted"
elif [ "$1" == "Save" ]; then
	echo "Killing battery consumption"
	echo powersave | sudo tee "$GOV_PATH" >/dev/null
	echo "Saving Battery on"
else
	echo "Who the fuck are you?"
	echo "Do the specified fuck"
	exit 1
fi
