$folder = "D:\\bomjik\\fastdl\\tf\\materials\\custom\\fempyro\\console\\models\\player\\pyro"

Get-ChildItem -Path $folder -Filter *.vmt -Recurse | ForEach-Object {
    $file = $_.FullName
    $content = Get-Content $file

    $newContent = $content | ForEach-Object {

        if ($_ -match '^\s*\$basetexture\s+"([^"]+)"') {
            $path = $matches[1]
            if ($path -notmatch '^custom/fempyro/') {
                $_ -replace [regex]::Escape($path), "custom/fempyro/$path"
            } else {
                $_
            }
        }
        elseif ($_ -match '^\s*\$bumpmap\s+"([^"]+)"') {
            $path = $matches[1]
            if ($path -notmatch '^custom/fempyro/') {
                $_ -replace [regex]::Escape($path), "custom/fempyro/$path"
            } else {
                $_
            }
        }
        else {
            $_
        }
    }

    Set-Content -Path $file -Value $newContent -Encoding UTF8
}

Write-Host "done!"
pause