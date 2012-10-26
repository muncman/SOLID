#!/bin/sh
set -e

# Coordinate building, running tests, and processing results.

mkdir -p unit_test_results

xcodebuild \
	-target SOLIDTests \
	-sdk iphonesimulator5.1 \
	-arch i386 \
	-scheme "CLI_UnitTests" \
	clean build \
	TEST_AFTER_BUILD=YES SL_RUN_UNIT_TESTS=YES \
	| tee unit_test_results/buildlog.txt \
	| SOLIDTests/ocunit2junit.rb
	# 2> unit_test_results/testlog.txt

ruby ./scripts/cli_unit_tests_with_results.rb