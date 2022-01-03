get-content "videos.txt" | ForEach-Object {

    if ("$_".Contains("#")) {
        Write-Host "Skipping comment $_";
    }
    elseif ([string]::IsNullOrWhiteSpace("$_")) {
        write-host "Skipping empty string $_";
    }
    else {

        write-host "downloading" $_ " as mp3"

        python -m youtube_dl -x -k --audio-format mp3 $_
    
    }

}

