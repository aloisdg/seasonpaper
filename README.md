# SeasonPaper

## Summary

Change your wallpaper by season

## Usage

### Set as wallpaper with [`Feh`](https://wiki.archlinux.org/index.php/Feh)

#### command

```bash
feh --bg-fill $(./seasonpaper)
```

#### xargs

```bash
./seasonpaper | xargs feh --bg-fill
```

### Download image with [`wget`](https://wiki.archlinux.org/index.php/Wget)

#### command

```bash
wget -q --show-progress $(./seasonpaper)
```

#### xargs

```bash
./seasonpaper | xargs wget -q --show-progress
```

## ChangeLog

### v0.2.0

- Follow the unix philosophy
- Remove dependecy to `wget` and `feh`
- Switch for a simple print of the image source

### v0.1.0

- Get season by current date
- Get first picture's direct link from season's subreddits (winterporn, etc.)
- Save the picture in /tmp
- Set the picture as wallpaper

## Idea

- Dont download the picture if it the same top post (or take the next post)
- Set manually the next season (a -s,--season ?)
- Get first link with a matching resolution (or greater) (a -r,--resolutions)
- Add a "-n, --next" In case you dont like the first picture, skip to the next one.
- Handle South Hemisphere
- Handle the world (moonsoon, etc.)
- Create a history `[Date] [Name] [link] [] [reddit]` format could be csv or json
- Add option (change each day, keep picture on an appropriate folder, verbose mode, etc)
- Create a .seasonpaper to save option
- Set season by geolocalisation
- Handle flickr