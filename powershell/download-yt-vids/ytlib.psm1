function downloadMP3 {
    param (
        $url
    )
    python -m youtube_dl -x -k --audio-format mp3 $url   
}

function downloadVideo {
    param (
        $url
    )
    python -m youtube_dl $url
}

function ensureLinksFileExists {
    if(!(test-path './links.txt')){
        echo 'https://www.youtube.com/watch?v=NkRcF8jJ_So' >> './links.txt'
    }
}

Export-ModuleMember -Function downloadMP3
Export-ModuleMember -Function downloadVideo
Export-ModuleMember -Function ensureLinksFileExists