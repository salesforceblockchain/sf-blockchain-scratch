#!/bin/bash

DURATION=7

if [ "$#" -eq 1 ]; then
  DURATION=$1
fi

sfdx force:org:create -a salesforce-blockchain -s -f config/project-scratch-def.json -d $DURATION
sfdx force:source:push
sfdx force:user:permset:assign -n salesforce_blockchain
sfdx force:package:install --package 04t1U000007I6SK -w 10 -r
sfdx force:apex:execute -f scripts/EnableC2C.apex
sfdx force:org:open -p /lightning/page/home

echo "The org has been setup and configured."
