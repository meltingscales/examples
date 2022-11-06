#!/usr/bin/env bash
URLS1=https://vimeo.com/390580961
FILES1=intoTheCloudSeasonOne.mp4
FORMATS1="intoTheCloudSeasonOne.%(ext)s"

URLS2=https://www.youtube.com/watch?v=rFbQd7VIILc
FILES2=intoTheCloudSeasonTwo.mp4
FORMATS2="intoTheCloudSeasonTwo.%(ext)s"

MERGED_FILE=intoTheCloudMerged.mp4

function ensure_exists {
    if ! command -v $1 &> /dev/null
    then
        echo "The command $1 could not be found. Try $2"
        exit
    fi
}

ensure_exists "ffmpeg" "apt install ffmpeg"
ensure_exists "yt-dlp" "snap install yt-dlp"

if [ ! -e $FILES1 ]; then
    yt-dlp $URLS1 -o $FORMATS1 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
else 
    echo "$FILES1 already exists"
fi

if [ ! -e $FILES2 ]; then
    yt-dlp $URLS2 -o $FORMATS2 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"
else 
    echo "$FILES2 already exists"
fi

if [ -e $FILES1 -a -e $FILES2 ]; then
    echo "Both files exist."
    if [ ! -e $MERGED_FILE ]; then
        echo "Creating $MERGED_FILE as it does not exist..."

        echo "Normalizing MP4 presentation timestamps..."
    
        #display info about file s1 and s2 - where I got 12288 from
        ffmpeg -i $FILES1
        ffmpeg -i $FILES2

        if [ ! -e $FILES1.normalized.mp4 ]; then
            ffmpeg -i $FILES1 -vf setdar=16/9 -video_track_timescale 12288 -ac 1 -ar 48000 $FILES1.normalized.mp4
        fi

        if [ ! -e $FILES2.normalized.mp4 ]; then
            ffmpeg -i $FILES2 -vf setdar=16/9 -video_track_timescale 12288 -ac 1 -ar 48000 $FILES2.normalized.mp4
        fi

        echo -n "" > input.txt
        echo    "file '$FILES1.normalized.mp4'" >> input.txt
        echo -n "file '$FILES2.normalized.mp4'" >> input.txt
        ffmpeg -f concat -i input.txt -codec copy $MERGED_FILE
    fi
fi