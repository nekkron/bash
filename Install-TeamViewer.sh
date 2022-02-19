#!/bin/bash
# https://www.reddit.com/r/Intune/comments/lztggm/deploying_teamviewer_with_custom_config_to_macos/
cd /tmp

#Download and Install custom host
echo "Downloading and Installing custom host"
cd /tmp
curl -L https://download.teamviewer.com/download/version_15x/CustomDesign/Install%20TeamViewerHost-idc<YOUR CUSTOM ID>.pkg -o TeamViewerHost-idc<YOUR CUSTOM ID>.pkg
installer -pkg TeamViewerHost-idc<YOURCUSTOMID>.pkg -target /

#echo "Give TeamViewer a bit of time to install before performing account assignment"
sleep 60

#Assignment
echo "Assigning device to an account & group"
computername=$(hostname -s)
sudo /Applications/TeamViewerHost.app/Contents/Helpers/TeamViewer_Assignment -api-token <YOUR API TOKEN> -alias $computername -group-id <YOUR GROUP ID> -reassign -grant-easy-access

# What is my Group ID? (https://community.teamviewer.com/English/discussion/53809/automatic-device-assignment#:~:text=You%20will%20be%20able%20to,number%20would%20be%20%22XXXXXX%22.)

#echo "Short wait to finalize the TV account assignment"
sleep 10
