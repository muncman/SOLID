#!/bin/sh
# UIAutomation script. Built upon information from many others, especially Jonathan Penn and his gists.

# One way to make sure the simulator isn't already running.
osascript -e 'tell app "iPhone Simulator" to quit'

# For benefit of log files.
echo $0 $*
# Better to fail early...
set -e
# set -o errexit
# set -o verbose

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

# cd ..
xcodebuild -sdk iphonesimulator CONFIGURATION_BUILD_DIR=$INSTRUMENTS_BUILD_DIR clean build
# cd -

# Control which type of simulator mode we want.
/usr/libexec/PlistBuddy $INSTRUMENTS_BUILD_DIR/SOLID.app/Info.plist \
        -c "Delete :UIDeviceFamily" \
        -c "Add :UIDeviceFamily array" \
        -c "Add :UIDeviceFamily: integer $DEVICE_TYPE"

instruments \
	-t "$WORKSPACE/SOLIDFunc/Automation.tracetemplate" \
	$INSTRUMENTS_BUILD_DIR/SOLID.app \
	-e UIASCRIPT "$WORKSPACE/$SCRIPT_NAME" \
	-e UIARESULTSPATH $INSTRUMENTS_OUTPUT_DIR 

# Another way to make sure the simulator isn't already running.
killall -m -KILL "iPhone Simulator"

# NEXT: Set up CI job to parse for "Error:" and/or "Fail:" to fail the job.
#   OR: Use Ruby to change return value, per CocoaManifest's approach.
