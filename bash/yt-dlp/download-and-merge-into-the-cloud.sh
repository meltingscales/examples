#!/usr/bin/env bash
URLS1=https://vimeo.com/390580961
FILES1=intoTheCloudSeasonOne.mp4
FORMATS1="intoTheCloudSeasonOne.%(ext)s"

URLS2=https://www.youtube.com/watch?v=rFbQd7VIILc
FILES2=intoTheCloudSeasonTwo.mp4
FORMATS2="intoTheCloudSeasonTwo.%(ext)s"

function ensure_exists {
    if ! command -v $1 &> /dev/null
    then
        echo "The command $1 could not be found. Try $2"
        exit
    fi
}

ensure_exists "ffmpeg" "apt install ffmpeg"
ensure_exists "yt-dlp" "snap install yt-dlp"

if [ ! -f $FILES1 ]; then
    yt-dlp $URLS1 -o $FORMATS1 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
else 
    echo "$FILES1 already exists"
fi

if [ ! -f $FILES2 ]; then
    yt-dlp $URLS2 -o $FORMATS2 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
else 
    echo "$FILES2 already exists"
fi