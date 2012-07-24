#!/bin/sh

# One way to make sure the simulator isn't already running.
osascript -e 'tell app "iPhone Simulator" to quit'

# cd SOLID
# xcodebuild -target SOLID -configuration Debug -sdk iphonesimulator TARGETED_DEVICE_FAMILY=1 clean build
# cd ..

set -e

# echo "Dollar zero is"
# echo $0
if [ -z "$WORKSPACE" ]
then
	export WORKSPACE=`pwd`
	echo "set WORKSPACE to $WORKSPACE"
fi

# TODO: app bundle env var
# /usr/libexec/PlistBuddy ./build/Debug-iphonesimulator/SOLID.app/Info.plist \
#         -c "Delete :UIDeviceFamily" \
#         -c "Add :UIDeviceFamily array" \
#         -c "Add :UIDeviceFamily: integer 1"

# instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" -e UIASCRIPT $HOME/workspace/SOLID/SOLIDFunc/testSOLID.js -e UIARESULTSPATH $HOME/workspace/SOLID/SOLIDFunc/output
instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" -e UIASCRIPT "$WORKSPACE/SOLIDFunc/testSOLID.js" -e UIARESULTSPATH "$WORKSPACE/SOLIDFunc/output" 

# run_uiautomation.rb "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" $HOME/workspace/SOLID/SOLIDFunc/testSOLID.js $HOME/workspace/SOLID/SOLIDFunc/output
# ./run_uiautomation.rb "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" "$WORKSPACE/SOLIDFunc/testSOLID.js" "$WORKSPACE/SOLIDFunc/output"
# "$WORKSPACE/SOLIDFunc/run_uiautomation.rb" "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" "$WORKSPACE/SOLIDFunc/testSOLID.js" "$WORKSPACE/SOLIDFunc/output"

# Another way to make sure the simulator isn't already running.
killall -m -KILL "iPhone Simulator"
