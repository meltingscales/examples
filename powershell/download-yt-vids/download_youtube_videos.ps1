Push-Location "./media/"

get-content "../videos.txt" | ForEach-Object {

    if ("$_".Contains("#")) {
        Write-Host "Skipping comment $_";
    }
    elseif ([string]::IsNullOrWhiteSpace("$_")) {
        write-host "Skipping empty string $_";
    }
    else {
    
        write-host "downloading" $_

        python -m youtube_dl $_
    }
}

Pop-Location