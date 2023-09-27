Write-Host "Convert images to webp"
Write-Host "Working Directory: $pwd"
Write-Host "Path to unoptimized images: .\unoptimized images"
Write-Host "Path to optimized images: .\optimized images"
Write-Host "Start converting files..."
foreach ($file in Get-ChildItem -Path ".\unoptimized images" -Recurse -Include ("*.jpg","*.jpeg","*.png"))
{
    Write-Host "Convert $file"
    $fileName = $file.BaseName + $file.Extension

    # Define the command as a string
    magick convert "$file" -resize "600" "./optimized images/$($file.BaseName).webp"
}
Write-Host "Finished converting files"
Pause