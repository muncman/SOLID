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
	clean build

# TODO: not needed? due to scheme config? TEST_AFTER_BUILD=YES \

echo "Generating coverage.xml"
# "$WORKSPACE/gcovr" -r "$WORKSPACE" --e '.*UnitTests.*' --xml > "$WORKSPACE/coverage.xml"
"$WORKSPACE/gcovr" -r "$WORKSPACE" --e '.*UnitTests.*' --keep --xml > "$WORKSPACE/coverage.xml"

# FIXME: This is still unreliable with Xcode 4.5/LLVM. 
# In CI, everything seems to run twice, and only sometimes do the tests run the second time. (else no .gcda files!)
# First and Second commands, from log: 
# The full launch command: /usr/local/bin/ios-sim launch "/Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/build/SOLID.app" --verbose --setenv XCInjectBundleInto="/Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/build/SOLID.app/SOLID" --setenv DYLD_INSERT_LIBRARIES="/../../Library/PrivateFrameworks/IDEBundleInjection.framework/IDEBundleInjection" --setenv XCInjectBundle="/Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/build/SOLIDTests.octest" --sdk 5.1 --args -SenTest All /Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/build/SOLIDTests.octest
# The full launch command: /usr/local/bin/ios-sim launch "/Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/CoverageBuild/SOLID.app" --verbose --setenv XCInjectBundleInto="/Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/CoverageBuild/SOLID.app/SOLID" --setenv XCInjectBundle="/Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/CoverageBuild/SOLIDTests.octest" --setenv DYLD_INSERT_LIBRARIES="/../../Library/PrivateFrameworks/IDEBundleInjection.framework/IDEBundleInjection" --sdk 5.1 --args -SenTest All /Users/muncman/.jenkins/jobs/code_coverage_with_gcovr/workspace/CoverageBuild/SOLIDTests.octest
# Formerly all in Jenkins = 
# set -e
# osascript -e 'tell app "iPhone Simulator" to quit'
# INSTRUMENTS_BUILD_DIR=$WORKSPACE/build # /tmp/SOLID_AUTOMATION
# echo INSTRUMENTS_BUILD_DIR = $INSTRUMENTS_BUILD_DIR
# mkdir -p $INSTRUMENTS_BUILD_DIR
# xcodebuild -target SOLIDTests -sdk iphonesimulator5.1 -arch i386 -scheme "CLI_UnitTests" CONFIGURATION_BUILD_DIR=$INSTRUMENTS_BUILD_DIR clean build TEST_AFTER_BUILD=YES
# "$WORKSPACE/scripts/run_gcovr.sh"
