#!/bin/sh
set -e
# You must setenv/export TF_TOKEN and TF_TEAM_TOKEN for this script. 
# Maybe set in Jenkins' 'Configure System' | 'Global properties' section.
curl http://testflightapp.com/api/builds.json \
	-F file=@build/Release-iphoneos/SOLID-Release-1.0.ipa \
	-F dsym=@build/Release-iphoneos/SOLID-Release-1.0-dSYM.zip \
	-F api_token=$TF_TOKEN \
	-F team_token=$TF_TEAM_TOKEN \
	-F notes="This is an autodeploy build from Jenkins via curl" \
	-F distribution_lists='memyself' \
	-F notify=True 
