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

Push-Location "./media/"

get-content "../links.txt" | ForEach-Object {

    if ("$_".Substring(0, 1).Contains("#")) {
        Write-Host "Skipping comment $_";
    }
    elseif ([string]::IsNullOrWhiteSpace("$_")) {
        write-host "Skipping empty string $_";
    }
    else {

        parts = "$_".Split('#')
        url = parts[0]

        if (parts.Length -gt 1) {
            write-host "Ignoring comment: " parts[1]
        }

        write-host "downloading" $_ " as video"

        downloadVideo $_
    }
}

Pop-Location