#!/bin/sh
set -e
# xcodebuild -target SOLIDTests -configuration Release -arch i386 -sdk iphonesimulator GCC_SYMBOLS_PRIVATE_EXTERN=NO COPY_PHASE_STRIP=NO TEST_AFTER_BUILD=YES clean build | SOLIDTests/ocunit2junit.rb
# xcodebuild -target SOLID -configuration Debug -arch i386 -sdk iphonesimulator TEST_AFTER_BUILD=NO clean build
xcodebuild -target SOLIDTests -configuration Debug -arch i386 -sdk iphonesimulator TEST_AFTER_BUILD=YES clean build | SOLIDTests/ocunit2junit.rb
