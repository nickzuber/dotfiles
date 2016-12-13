#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_battery_percentage() {
	# percentage displayed in the 2nd field of the 2nd row
	if command_exists "pmset"; then

		### This is a custom alteration for my Macbook Pro -- this changes the colour
		### of the battery percentage based on how much is left.

		batteryPercentageString=$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')
		batteryPercentageNumber=${batteryPercentageString::${#batteryPercentageString}-1}

		if [ $batteryPercentageNumber -gt 75 ]; then
			printf "#[fg=#15ca6e]$batteryPercentageNumber"
		elif [ $batteryPercentageNumber -gt 50 ]; then
			printf "#[fg=#ffeb3b]$batteryPercentageNumber"
		elif [ $batteryPercentageNumber -gt 20 ]; then
			printf "#[fg=#f7b72b]$batteryPercentageNumber"
		else
			printf "#[fg=#f87e78]$batteryPercentageNumber"
		fi
		printf "%%#[default]"

		### End of the custom alteration

	elif command_exists "upower"; then
		for battery in $(upower -e | grep battery); do
			upower -i $battery | grep percentage | awk '{print $2}'
		done | xargs echo
	elif command_exists "acpi"; then
		acpi -b | grep -Eo "[0-9]+%"
	fi
}

main() {
	print_battery_percentage
}
main
