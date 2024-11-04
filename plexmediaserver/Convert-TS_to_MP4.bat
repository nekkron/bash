@echo off

set source_dir="Z:\Italian TV"

for %%f in ("%source_dir%\*.ts") do (
    set output_file=%%~nf.mp4
    if not exist "%output_file%" (
        echo Converting %%f to %output_file%
        ffmpeg -i "%%f" -c:v libx264 -c:a aac "%output_file%"
    ) else (
        echo %output_file% already exists. Skipping conversion.
    )
)