#!/bin/sh
set -e
xcodebuild \
	-target SOLID \
	-configuration Debug \
	-arch i386 \
	-sdk iphonesimulator \
	TEST_AFTER_BUILD=NO \
	clean build