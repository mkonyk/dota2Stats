#!/usr/bin/env bash

export FORCE_SHOW_SPINNER=true

start=`date +%s`

echo "deleting previous scratch org"
sfdx force:org:delete -u dota2scratch -p
echo "creating scratch org"
sfdx force:org:create -s -f ./config/project-scratch-def.json -a dota2scratch -d 30
echo "push changes"
sfdx force:source:push -f
echo "add Permission Set"
sfdx force:user:permset:assign -n diag_2_admin
echo "open org"
sfdx force:org:open

end=`date +%s`
runtime=$((end-start))
echo "executing time = $runtime"