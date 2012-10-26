#!/bin/sh
set -e

#
# Bare bones "just clean and compile" command.
#

xcodebuild \
	-target SOLID \
	-configuration Debug \
	-arch i386 \
	-sdk iphonesimulator \
	TEST_AFTER_BUILD=NO \
	clean build

# xcodebuild -target SOLID -configuration Debug -arch i386 -sdk iphonesimulator clean build