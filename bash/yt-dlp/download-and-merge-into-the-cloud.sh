#!/usr/bin/env bash
URLS1=https://vimeo.com/390580961
URLS2=https://www.youtube.com/watch?v=rFbQd7VIILc

function ensure_exists {
    if ! command -v $1 &> /dev/null
    then
        echo "The command $1 could not be found. Try $2"
        exit
    fi
}

ensure_exists "ffmpeg" "apt install ffmpeg"
ensure_exists "yt-dlp" "pip install yt-dlp"