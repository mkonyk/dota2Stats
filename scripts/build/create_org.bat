SET mypath=%~dp0
echo %mypath%
SET mypath=%mypath:~0,-1%
echo %mypath%
SET start_time=%time%

echo start time %time%
echo "deleting previous scratch org"
call sfdx force:org:delete -u SteamAPI -p
echo creating scratch org
call sfdx force:org:create -s -f %mypath%\..\..\config\project-scratch-def.json -a SteamAPI -d 30
echo push changes
call sfdx force:source:push -f
echo add Permission Set
echo push data
echo open org
call sfdx force:org:open

SET end_time=%time%
echo start time %start_time%
echo end time %end_time%