echo "You must export TF_TOKEN and TF_TEAM_TOKEN in the Execute Shell block before calling this script."
curl http://testflightapp.com/api/builds.json -F file=@build/Release-iphoneos/SOLID-Release-1.0.ipa -F dsym=@build/Release-iphoneos/SOLID-Release-1.0-dSYM.zip -F api_token='TF_TOKEN' -F team_token='TF_TEAM_TOKEN' -F notes="This is an autodeploy build from Jenkins via curl" -F notify=True 
# -F distribution_lists=’<name of test distribution list>’ -F replace=False