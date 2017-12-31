#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

battery_discharging() {
	local status="$(battery_status)"
	[[ $status =~ (discharging) ]]
}

### This is a custom alteration that makes it so the `battery_remain` is replaced
### with a coloured bar graph representing how much battery is left.
pmset_battery_remaining_time() {

	batteryPercentageString=$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $2 }')
	batteryPercentageNumber=${batteryPercentageString::${#batteryPercentageString}-1}

	if [ $batteryPercentageNumber -gt 88 ]; then
		printf "#[fg=#15ca6e]■■■■■■■■"
	elif [ $batteryPercentageNumber -gt 76 ]; then
		printf "#[fg=#15ca6e]■■■■■■■#[fg=#666666]■"
	elif [ $batteryPercentageNumber -gt 64 ]; then
		printf "#[fg=#15ca6e]■■■■■■#[fg=#666666]■■"
	elif [ $batteryPercentageNumber -gt 52 ]; then
		printf "#[fg=#ffeb3b]■■■■■#[fg=#666666]■■■"
	elif [ $batteryPercentageNumber -gt 40 ]; then
		printf "#[fg=#ffeb3b]■■■■#[fg=#666666]■■■■"
	elif [ $batteryPercentageNumber -gt 28 ]; then
		printf "#[fg=#f7b72b]■■■#[fg=#666666]■■■■■"
	elif [ $batteryPercentageNumber -gt 15 ]; then
		printf "#[fg=#f87e78]■■#[fg=#666666]■■■■■■"
	else
		printf "#[fg=#f87e78]■#[fg=#666666]■■■■■■■"
	fi
	printf "#[default]"

	### End of the custom alteration
}

ORIGINAL_pmset_battery_remaining_time() {
	local output="$(pmset -g batt | awk 'NR==2 { gsub(/;/,""); print $4 }')"
	# output has to match format "10:42"
	if [[ "$output" =~ ([[:digit:]]{1,2}:[[:digit:]]{2}) ]]; then
		printf "$output"
	fi
}

print_battery_remain() {
	if command_exists "pmset"; then
		pmset_battery_remaining_time
	elif command_exists "upower"; then
		battery=$(upower -e | grep battery | head -1)
		upower -i $battery | grep remain | awk '{print $4}'
	elif command_exists "acpi"; then
		acpi -b | grep -Eo "[0-9]+:[0-9]+:[0-9]+"
	fi
}

main() {
	# Comment out the battery discharging check since we're showing a graph now
	# if battery_discharging; then
		print_battery_remain
	# fi
}
main
