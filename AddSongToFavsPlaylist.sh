#!/bin/bash

PLAYLIST='/home/Jupiter/Music/# You May Spank It, ONCE.m3u'

# Get the current playing song. -f is the format option, %file% gives the file path
SONG=$(mpc -f %file% current)

# Check if the song is already in the playlist, if not append it to it
grep -qxF -- "$SONG" "$PLAYLIST" || echo "$SONG" >> "$PLAYLIST"

# Sort alphabetically the playlist and -o output it to the second file
# The advantage over using > is that if its the same file (like this case) > leaves an empty file
sort -o "$PLAYLIST" "$PLAYLIST"

# One liner version of the adding only if its not in the file already
#song=$(mpc -f %file% current); grep -qxF "$song" "/home/Mars/musik/# You May Spank It, ONCE.m3u" || echo "$song" >> "/home/Mars/musik/# You May Spank It, ONCE.m3u"
# mpc -f %file% current | xargs -I % grep -qxF % "/home/Mars/musik/# You May Spank It, ONCE.m3u" || echo % >> "/home/Mars/musik/# You May Spank It, ONCE.m3u"