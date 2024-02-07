$outputdir = 'c:\output'
$url = 'https:address.com\directory'

# Verify if the output directory exists
if (!(Test-Path -Path $outputdir)) {
    Write-Host "Output directory does not exist."
    return
}

# Enable TLS 1.2 and TLS 1.1 protocols
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11

function Download-Files {
    param (
        [string]$url,
        [string]$outputdir
    )

    $WebResponse = Invoke-WebRequest -Uri $url

    # Get the list of links, handle files and directories
    $WebResponse.Links | Select-Object -ExpandProperty href -Skip 1 | ForEach-Object {
        if ($_ -notmatch '/$') { # File
            Write-Host "Downloading file '$_'"
            $filePath = Join-Path -Path $outputdir -ChildPath $_
            $fileUrl = '{0}/{1}' -f $url.TrimEnd('/'), $_
            Invoke-WebRequest -Uri $fileUrl -OutFile $filePath
        } else { # Directory
            Write-Host "Exploring directory '$_'"
            $newOutputDir = Join-Path -Path $outputdir -ChildPath $_.TrimEnd('/')
            $newUrl = '{0}/{1}' -f $url.TrimEnd('/'), $_
            if (!(Test-Path -Path $newOutputDir)) { New-Item -Path $newOutputDir -ItemType Directory }
            Download-Files -url $newUrl -outputdir $newOutputDir
        }
    }
}

Download-Files -url $url -outputdir $outputdir
