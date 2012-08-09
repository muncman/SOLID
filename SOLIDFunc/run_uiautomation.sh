#!/bin/sh
# UIAutomation script. Built upon information from many others, especially Jonathan Penn and his gists.

# One way to make sure the simulator isn't already running.
osascript -e 'tell app "iPhone Simulator" to quit'

# For benefit of log files.
echo $0 $*
# Better to fail early...
set -e

if [ -z "$WORKSPACE" ]
then
	WORKSPACE=`pwd`
	echo "set WORKSPACE to $WORKSPACE"
fi

SCRIPT_NAME=$1
if [ -z $1 ]
then
	echo "USAGE: run_uiautomation.sh <test-javascript-file-relative-to-workspace-root> [1|2]"
	echo "       1 for iPhone, 2 for iPad. Default: iPhone."
	echo "EXAMPLE: ./SOLIDFunc/run_uiautomation.sh SOLIDFunc/testSOLID_iPhone.js 2"
	exit 1
fi
echo "SCRIPT_NAME is $SCRIPT_NAME"

DEVICE_TYPE=$2
if [ -z $2 ]
then
	DEVICE_TYPE=1
	echo "No device type passed in (1 for iPhone, 2 for iPad), so defaulting to iPhone"
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
/usr/libexec/PlistBuddy $INSTRUMENTS_BUILD_DIR/SOLID.app/Info.plist \
        -c "Delete :UIDeviceFamily" \
        -c "Add :UIDeviceFamily array" \
        -c "Add :UIDeviceFamily: integer $DEVICE_TYPE"

# cd ..
# xcodebuild -target SOLID -configuration Debug -sdk iphonesimulator TARGETED_DEVICE_FAMILY=1 clean build
xcodebuild -sdk iphonesimulator build CONFIGURATION_BUILD_DIR=$INSTRUMENTS_BUILD_DIR
# cd -

# instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate $INSTRUMENTS_BUILD_DIR/SOLID.app -e UIASCRIPT "$WORKSPACE/SOLIDFunc/testSOLID.js" -e UIARESULTSPATH $INSTRUMENTS_OUTPUT_DIR 
instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate $INSTRUMENTS_BUILD_DIR/SOLID.app -e UIASCRIPT "$WORKSPACE/$SCRIPT_NAME" -e UIARESULTSPATH $INSTRUMENTS_OUTPUT_DIR 

# Another way to make sure the simulator isn't already running.
killall -m -KILL "iPhone Simulator"

# NEXT: Set up CI job to parse for "Error:" and/or "Fail:" to fail the job.
#   OR: Use Ruby to change return value, per CocoaManifest's approach.
