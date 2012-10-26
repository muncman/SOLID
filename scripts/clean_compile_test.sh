#!/bin/sh
set -e

#
# Clean, build and run the unit tests. Process output into JUnit-style HTML report. 
# GCC_SYMBOLS_PRIVATE_EXTERN=NO COPY_PHASE_STRIP=NO TEST_AFTER_BUILD=YES
#

# For <Xcode 4.5 w/ iOS 6
# xcodebuild \
# 	-target SOLIDTests \
# 	-configuration Debug \
# 	-arch i386 \
# 	-sdk iphonesimulator \
# 	TEST_AFTER_BUILD=YES \
# 	clean build | SOLIDTests/ocunit2junit.rb

xcodebuild \
	-target SOLIDTests \
	-configuration Debug \
	-arch i386 \
	-sdk iphonesimulator \
	TEST_AFTER_BUILD=YES \
	clean build | SOLIDTests/ocunit2junit.rb
