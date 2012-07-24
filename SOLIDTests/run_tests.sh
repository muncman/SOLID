#!/bin/sh
set -e
xcodebuild -target SOLIDTests -configuration Debug -arch i386 -sdk iphonesimulator TEST_AFTER_BUILD=YES clean build | SOLIDTests/ocunit2junit.rb
