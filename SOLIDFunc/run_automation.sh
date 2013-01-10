# Copyright (c) 2012 Jonathan Penn (http://cocoamanifest.net/)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# For benefit of log files.
echo $0 $*
# Make sure bash fails completely if any command fails
set -e

# One way to make sure the simulator isn't already running.
osascript -e 'tell app "iPhone Simulator" to quit'

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

# We need a temporary place to build the app bundle
BUILD_DIR=/tmp/AutomationExample

# TODO: clean out previous build
# Ensure our temporary directory exists
mkdir -p $BUILD_DIR

# Build our application and place the final bundle in our temporary directory
xcodebuild -sdk iphonesimulator clean build CONFIGURATION_BUILD_DIR=$BUILD_DIR

# Clean out any existing automation results (we don't need to keep them for this demo)
rm -rf automation_results
mkdir -p automation_results

# Control which type of simulator mode we want.
/usr/libexec/PlistBuddy $BUILD_DIR/SOLID.app/Info.plist \
        -c "Delete :UIDeviceFamily" \
        -c "Add :UIDeviceFamily array" \
        -c "Add :UIDeviceFamily: integer $DEVICE_TYPE"

# Here's the magic to run Instruments from the command line. This is actually
# one big command that is broken out onto separate lines for readability by
# ending each one with the continuing "\".  Let's break down the parameters:
#
# -D - Takes a trace document that instruments will write the trace to
#
# -t - Takes an Instruments template with the UI Automation instrument in it.
#      Can have other instruments set up as well for performance or other monitoring
#      over the life of the script.
#
# .app - The path to the app bundle (compiled from the commands above)
#
# -e UIRESULTSPATH ... - Specify a directory to stash all the automation results
#
# -e UIASCRIPT ... - Specify the actual Javascript file to run
#
# Read the comments in the "unix_instruments" script for why we need it as a
# wrapper around the "instruments" command.
cd SOLIDFunc
echo `pwd`
./unix_instruments \
  -D automation_results/trace \
  -t UIAutomationTemplate.tracetemplate \
  $BUILD_DIR/SOLID.app \
  -e UIARESULTSPATH automation_results \
  -e UIASCRIPT "./$SCRIPT_NAME"
cd -

# Another way to make sure the simulator isn't already running.
killall -m -KILL "iPhone Simulator"

echo "Tests passed!"

