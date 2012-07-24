#!/bin/sh

osascript -e 'tell app "iPhone Simulator" to quit'

# cd SOLID
# xcodebuild -target SOLID -configuration Debug -sdk iphonesimulator TARGETED_DEVICE_FAMILY=1 clean build
# cd ..

#instruments -t /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" -e UIASCRIPT $HOME/workspace/SOLID/SOLIDFunc/testSOLID.js -e UIARESULTSPATH $HOME/workspace/SOLID/SOLIDFunc/output
run_uiautomation.rb "$HOME/Library/Application Support/iPhone Simulator/5.1/Applications/3C8EE392-E24F-49B7-A8AD-1E564B11DF84/SOLID.app" $HOME/workspace/SOLID/SOLIDFunc/testSOLID.js $HOME/workspace/SOLID/SOLIDFunc/output
