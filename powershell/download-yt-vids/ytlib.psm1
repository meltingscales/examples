$defaultLinksFile='links.txt'

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
    if (!(test-path $defaultLinksFile)) {
        Write-Output 'https://www.youtube.com/watch?v=NkRcF8jJ_So' >> './links.txt'
    }
}

function processVideoList {
    param(
        $downloadType
    )

    Push-Location "./media/"

    get-content "../$defaultLinksFile" | ForEach-Object {

        $parts = "$_".Split('#')
        $url = $parts[0]

        if ("$_".Substring(0, 1).Contains("#")) {
            Write-Host "Skipping comment $_";
        }
        elseif ([string]::IsNullOrWhiteSpace("$_")) {
            write-host "Skipping empty string $_";
        }
        else {

            if ($parts.Length -gt 1) {
                write-host "Ignoring comment after video: " $parts[1]
            }

            write-host "downloading" $url
        
            if ($downloadType -eq "mp3") {
                downloadMP3 $url
            }
            elseif ($downloadType -eq "video") {
                downloadVideo $url
            }
            else {
                Write-Host "Unknown type of download $downloadType -- understood types are 'mp3' or 'video'."
            }

        }
    }

    Pop-Location

}

Export-ModuleMember -Function ensureLinksFileExists, processVideoList