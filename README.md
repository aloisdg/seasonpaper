# SeasonPaper

Change your wallpaper by season

## ChangeLog

### v0.1.0

- Get season by current date
- Get first picture's direct link from season's subreddits (winterporn, etc.)
- Save the picture in /tmp
- Set the picture as wallpaper

## To Do

- Remove dependecy to feh. Let the user decide.

## Bonus

- Handle South
- Handle the world
- Create a history `[Date] [Name] [link] [] [reddit]` format could be csv or json
- Add option (change each day, keep picture on an appropriate folder, verbose mode, etc)
- Create a .seasonpaper to save option
- Dont download the picture if it the same top post (or take the next post)
- Set manually the next season (a -s,--season ?)
- Get first link with a matching resolution (or greater) (a -r,--resolutions)
- Set season with geolocalisation handling
- Handle flickr
- Add a "-n, --next" In case you dont like the first picture, skip to the next one.
