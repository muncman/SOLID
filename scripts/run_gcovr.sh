#!/bin/sh
#Follow with the Cobertura plugin.
set -e
if [ -z "$WORKSPACE" ]
then
	export WORKSPACE=`pwd`
fi
echo "WORKSPACE is $WORKSPACE"

# TODO: killall -m -KILL "iPhone Simulator"

BUILD_DIR=$WORKSPACE/CoverageBuild
TEMP_DIR=$WORKSPACE/CoverageTemp
# rm -rf ./SOLIDTests.build/

# xcodebuild \
# 	-scheme SOLIDTests \
# 	-target SOLIDTests \
# 	-configuration Debug \
# 	-arch i386 \
# 	-sdk iphonesimulator \
# 	OBJROOT=$BUILD_DIR/build.obj \
# 	SYMROOT=$BUILD_DIR/build.sym \
# 	DSTROOT=$BUILD_DIR/build.dst \
# 	SHARED_PRECOMPS_DIR=$BUILD_DIR/build.pch \
# 	CONFIGURATION_BUILD_DIR=$BUILD_DIR \
# 	CONFIGURATION_TEMP_DIR=$TEMP_DIR \
# 	GCC_SYMBOLS_PRIVATE_EXTERN=NO \
# 	COPY_PHASE_STRIP=NO \
# 	clean build \
# 	TEST_AFTER_BUILD=YES

xcodebuild \
	-scheme SOLIDTests \
	-target SOLIDTests \
	-configuration Debug \
	-arch i386 \
	-sdk iphonesimulator \
	CONFIGURATION_BUILD_DIR=$BUILD_DIR \
	CONFIGURATION_TEMP_DIR=$TEMP_DIR \
	TEST_AFTER_BUILD=YES \
	clean build

echo "Generating coverage.xml"
# "$WORKSPACE/gcovr" -r "$WORKSPACE" --e '.*UnitTests.*' --xml > "$WORKSPACE/coverage.xml"
"$WORKSPACE/gcovr" -r "$WORKSPACE" --e '.*UnitTests.*' --keep --xml > "$WORKSPACE/coverage.xml"
