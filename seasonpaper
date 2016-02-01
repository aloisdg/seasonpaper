#!/bin/bash

# v0.1.0

# https://en.wikipedia.org/wiki/Solstice
# http://www.developpez.net/forums/d880640/java/general-java/calcul-saisons/
# http://www.jgiesen.de/astro/astroJS/seasons/seasons.js
# http://stackoverflow.com/questions/1579587/how-can-i-get-the-current-season-using-net-summer-winter-etc

# todo
# handle no internet

# http://stackoverflow.com/questions/1579587/how-can-i-get-the-current-season-using-net-summer-winter-etc
# no native floating point in bash so n*100
function getSeason {

# 	function HandleHemisphere {
# 		local hemisphere=0
# 
# 		# come from south
# 		if [ $1 = true ]; then
# 			hemisphere=2
# 		fi
# 
# 		echo $($($2 + $hemisphere) % 4)
# 	}
	
	readonly seasons=(Spring Summer Autumn Winter)
	readonly month=$(date "+%m")
	readonly day=$(date "+%d")
	# local fromSouthernHemisphere=$1

	readonly dateAsInt=$(($((month + $((day / 100)))) * 100))
	if [ $dateAsInt -lt 321 ] || [ $dateAsInt -ge 1222 ]; then
		echo "${seasons[3]}"	# Winter
	elif [ $dateAsInt -lt 621 ]; then
		echo "${seasons[0]}"	# Spring
	elif [ $dateAsInt-lt 923 ]; then
		echo "${season[1]}"		# Summer
	else
		echo "${season[2]}"		# Autumn
	fi
}

# Get season

season=$(getSeason)

# Get picture url from Reddit

url="https://www.reddit.com/r/${season}Porn.json"

# get json | extract all url | remove the one who contains reddit | keep direct link (no flickr...) | keep first
source=$(curl -s "$url" | grep -Po '"url":.*?[^\\]",' | grep -v "reddit" | grep -Po '\bhttps?:[^)"]+\.(?:jpg|jpeg|png)' | (head -n1 && tail -n1))

# Set the picture as wallpaper

filename=$(basename "$source")
extension="${filename##*.}"

wget "$source" #-o "/tmp/seasonpaper.$extension" # file is corrupt # make silent ?
mv "$filename" "/tmp/seasonpaper.$extension"
feh --bg-fill "/tmp/seasonpaper.$extension"