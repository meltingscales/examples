Push-Location "./media/"

get-content "../links.txt" | ForEach-Object {

    if ("$_".Substring(0,1).Contains("#")) {
        Write-Host "Skipping comment $_";
    }
    elseif ([string]::IsNullOrWhiteSpace("$_")) {
        write-host "Skipping empty string $_";
    }
    else {

        url = "$_".Split('#')[0]

        write-host "downloading" $_

        python -m youtube_dl $_
    }
}

Pop-Location