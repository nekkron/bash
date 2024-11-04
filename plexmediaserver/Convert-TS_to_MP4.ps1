# Set the source directory
$sourceDir = "Z:\Italian TV"

# Get all .ts files in the directory
$tsFiles = Get-ChildItem -Path $sourceDir -Filter "*.ts"

foreach ($file in $tsFiles) {
    $outputFile = $file.FullName -replace '\.ts$', '.mp4'

    if (!(Test-Path $outputFile)) {
        Write-Host "Converting $file to $outputFile"
        ffmpeg -i "$($file.FullName)" -map 0 -c:v libx264 -c:a aac "$outputFile"
    } else {
        Write-Host "$outputFile already exists. Skipping conversion."
    }
}