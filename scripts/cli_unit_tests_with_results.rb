#!/usr/bin/ruby

# Based on http://baolei.tumblr.com/post/32428168156/ios-unit-test-from-command-line-ios6-xcode4-5

puts "Processing xcodebuild OCUnit results"

# RESULT_PATH = "unit_test_results" # vs from Xcode or Jenkins
# system("mkdir -p #{RESULT_PATH}")

# cmd = "xcodebuild -target SOLIDTests -sdk iphonesimulator5.1 -arch i386 -scheme \"CLI_UnitTests\" clean build TEST_AFTER_BUILD=YES SL_RUN_UNIT_TESTS=YES > #{RESULT_PATH}/buildlog.txt 2> #{RESULT_PATH}/testlog.txt"
# puts cmd
# system(cmd)

result = ""
# File.open("#{RESULT_PATH}/testlog.txt", "r") do |f|
File.open("unit_test_results/buildlog.txt", "r") do |f|

	result = f.read
end

fails = result.scan /Test Case .* failed/
passes = result.scan /Test Case .* passed/

if fails.length>0
	puts fails
	raise "Unit Tests failed"
else
	if passes.length>0
		puts "Unit Tests passed"
	else
		puts result
		raise "Unit Test setup problem"
	end
end