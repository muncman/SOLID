#!/bin/sh
# UIAutomation script. Built upon information from many others, especially Jonathan Penn and his gists.

# One way to make sure the simulator isn't already running.
osascript -e 'tell app "iPhone Simulator" to quit'

set -e

# echo $0
if [ -z "$WORKSPACE" ]
then
	WORKSPACE=`pwd`
	echo "set WORKSPACE to $WORKSPACE"
fi

INSTRUMENTS_BUILD_DIR=/tmp/SOLID_AUTOMATION
echo INSTRUMENTS_BUILD_DIR = $INSTRUMENTS_BUILD_DIR
mkdir -p $INSTRUMENTS_BUILD_DIR

INSTRUMENTS_OUTPUT_DIR="$WORKSPACE/SOLIDFunc/output"
echo INSTRUMENTS_OUTPUT_DIR = $INSTRUMENTS_OUTPUT_DIR
rm -rf $INSTRUMENTS_OUTPUT_DIR
mkdir -p $INSTRUMENTS_OUTPUT_DIR

# TODO: Look into this for controlling which simulator device we get, and where we should point it.
# /usr/libexec/PlistBuddy ./build/Debug-iphonesimulator/SOLID.app/Info.plist \
#         -c "Delete :UIDeviceFamily" \
#         -c "Add :UIDeviceFamily array" \
#         -c "Add :UIDeviceFamily: integer 1"

# cd ..
# xcodebuild -target SOLID -configuration Debug -sdk iphonesimulator TARGETED_DEVICE_FAMILY=1 clean build
xcodebuild -sdk iphonesimulator build CONFIGURATION_BUILD_DIR=$INSTRUMENTS_BUILD_DIR
# cd -

instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate $INSTRUMENTS_BUILD_DIR/SOLID.app -e UIASCRIPT "$WORKSPACE/SOLIDFunc/testSOLID.js" -e UIARESULTSPATH $INSTRUMENTS_OUTPUT_DIR 

# Another way to make sure the simulator isn't already running.
killall -m -KILL "iPhone Simulator"

# NEXT: Set up CI job to parse for "Error:" and/or "Fail:" to fail the job.
#   OR: Use Ruby to change return value, per CocoaManifest's approach.
