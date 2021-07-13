#!/bin/bash


# Check if the argument is a valid file
if [[ -f "$1" ]]; then
	PLAYLIST="$1"
else
	echo "Not a valid playlist file"
	echo "Provide the target playlist file as an argument"
	exit 1
fi

# Get the current playing song. -f is the format option, %file% gives the file path
SONG=$(mpc -f %file% current)

# Check if the song is already in the playlist, if not append it to it
# grep -qxF -- "$SONG" "$PLAYLIST" || echo "$SONG" >> "$PLAYLIST"

# Or just add it and remove duplicates later
echo "$SONG" >> "$PLAYLIST"

# Sort alphabetically the playlist and -o output it to the second file
# The advantage over using > is that if its the same file (like this case) > leaves an empty file
# -u to remove duplicate lines
sort -uo "$PLAYLIST" "$PLAYLIST"

echo "Added $SONG to $PLAYLIST"

# One liner version of the adding only if its not in the file already
#song=$(mpc -f %file% current); grep -qxF "$song" "/playlist/dir/file.m3u" || echo "$song" >> "/playlist/dir/file.m3u"
#mpc -f %file% current | xargs -I % echo % >> "/playlist/dir/file.m3u"