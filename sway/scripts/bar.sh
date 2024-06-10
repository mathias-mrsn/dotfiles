#!/bin/bash

date_formatted=$(date "+%a %F %H:%M")

battery_info=$(upower --show-info $(upower --enumerate |\
grep 'battery') |\
grep "percentage" |\
awk '{print $2}')

echo "battery: $battery_info; $date_formatted"

