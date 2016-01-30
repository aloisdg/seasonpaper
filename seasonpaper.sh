#!/bin/bash

# v0.1.0

# https://en.wikipedia.org/wiki/Solstice
# http://www.developpez.net/forums/d880640/java/general-java/calcul-saisons/
# http://www.jgiesen.de/astro/astroJS/seasons/seasons.js
# http://stackoverflow.com/questions/1579587/how-can-i-get-the-current-season-using-net-summer-winter-etc

# http://stackoverflow.com/a/17841619
function join {
    local value=$1 separator=$2 output=$3
    shift 3 || shift $(($#))
    printf -v "$value" "%s" "$output${*/#/$separator}"
}

# http://stackoverflow.com/a/5257398
function split {
    local value=$1 separator=$2 output=$3
	output=(${${value}//$separator/ })
}

# http://stackoverflow.com/questions/1579587/how-can-i-get-the-current-season-using-net-summer-winter-etc
# no native floating point in bash so n*100
function getSeason()
{
	readonly seasons=(Spring Summer Autumn Winter)	
	local month=$(date "+%m")
	local day=$(date "+%d")

	local value=$(($((month + $((day / 100)))) * 100))
	if [ $value -lt 321 ] || [ $value -ge 1222 ]; then
		echo "${seasons[3]}"	# Winter
    elif [ $value -lt 621 ]; then
		echo "${seasons[0]}"	# Spring
    elif [ $value -lt 923 ]; then
		echo "${season[1]}"	# Summer
    else
		echo "${season[2]}"	# Autumn
	fi
}

# Get season

season=$(getSeason)

# Get picture url from Reddit

url="https://www.reddit.com/r/${season}Porn.json"

# get json | extract all url | remove the one who contains reddit | keep direct link (no flickr...) | keep first
source=$(curl -s $url | grep -Po '"url":.*?[^\\]",' | grep -v "reddit" | grep -Po '\bhttps?:[^)"]+\.(?:jpg|jpeg|png)' | (head -n1 && tail -n1))

# Set the picture as wallpaper

filename=$(basename "$source")
extension="${filename##*.}"

wget $source #-o "/tmp/seasonpaper.$extension" # file is corrupt # make silent ?
mv $filename "/tmp/seasonpaper.$extension"
feh --bg-fill "/tmp/seasonpaper.$extension"