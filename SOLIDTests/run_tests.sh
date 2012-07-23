#!/bin/sh
xcodebuild -target SOLIDTests -configuration Debug -arch i386 -sdk iphonesimulator TEST_AFTER_BUILD=YES clean build | ./ocunit2junit.rb