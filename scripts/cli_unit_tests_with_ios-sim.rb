#!/usr/bin/ruby

# Based on http://stackoverflow.com/a/10823483
# and http://baolei.tumblr.com/post/32428168156/ios-unit-test-from-command-line-ios6-xcode4-5 

# xcodebuild -target SOLIDTests -sdk iphonesimulator5.0 -arch i386 -scheme "CLI_UnitTests" clean build TEST_AFTER_BUILD=YES SL_RUN_UNIT_TESTS=YES
# xcodebuild -target SOLIDTests -sdk iphonesimulator5.1 -arch i386 -scheme "CLI_UnitTests" build TEST_AFTER_BUILD=YES SL_RUN_UNIT_TESTS=YES

system("killall -m -KILL \"iPhone Simulator\"")

# if ENV['SL_RUN_UNIT_TESTS'] then
    # launcher_path = File.join(ENV['SRCROOT'], "Scripts", "ios-sim")
    launcher_path = "/usr/local/bin/ios-sim" # installed via homebrew
    test_bundle_path = File.join(ENV['BUILT_PRODUCTS_DIR'], "#{ENV['PRODUCT_NAME']}.#{ENV['WRAPPER_EXTENSION']}")

    the_test_host = ENV["TEST_HOST"]
    the_test_host = "#{test_bundle_path}/#{ENV['PRODUCT_NAME']}"
    puts "the_test_host = #{the_test_host}".gsub! "iphoneos", "iphonesimulator"

    environment = {
        'DYLD_INSERT_LIBRARIES' => "/../../Library/PrivateFrameworks/IDEBundleInjection.framework/IDEBundleInjection",
        'XCInjectBundle' => test_bundle_path,
        'XCInjectBundleInto' => ENV["TEST_HOST"]   
    }

    environment_args = environment.collect { |key, value| "--setenv #{key}=\"#{value}\""}.join(" ")

    app_test_host = File.dirname(ENV["TEST_HOST"])

    # system("#{launcher_path} launch \"#{app_test_host}\" #{environment_args} --args -SenTest All #{test_bundle_path}")
    cmd = "#{launcher_path} launch \"#{app_test_host}\" --verbose #{environment_args} --sdk 5.1 --args -SenTest All #{test_bundle_path}"
    cmd.gsub! "iphoneos", "iphonesimulator"
    puts "The full launch command: #{cmd}"
    system(cmd)
# else
#     puts "SL_RUN_UNIT_TESTS not set - Did not run unit tests!"
# end