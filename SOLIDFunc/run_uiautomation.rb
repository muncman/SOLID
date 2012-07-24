#!/usr/bin/env ruby -wKU
# From https://gist.github.com/2363450 and https://gist.github.com/2577939

require "fileutils"
require "pty"

unless ARGV.length == 3
  STDERR.puts "USAGE: run-test-script <app bundle> <test script> <output directory>"
  exit 1
end

app_bundle, test_script, test_output = *ARGV

command = "/usr/bin/instruments -t /Developer/Platforms/iPhoneOS.platform/Developer/Library/Instruments/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate #{app_bundle} -e UIASCRIPT #{test_script} -e UIARESULTSPATH ."

failed = false

# This is part of a rakefile I use for UI Automation that's part of an
# upcoming (secret) project that I hope to announce soon.

# You need to set the $app_bundle global variable to point to the application's
# bundle on disk. Then hand in 1 for iPhone or 2 for iPad to this function
# and it will manipulate the plist of the device.

def pick_simulator_device index
  # For now, the only way to tell UI Automation to run the iPad or iPhone
  # simulator is to change the app bundle plist to require only that device.
  sh %(/usr/libexec/PlistBuddy #{$app_bundle}/Info.plist \
        -c "Delete :UIDeviceFamily" \
        -c "Add :UIDeviceFamily array" \
        -c "Add :UIDeviceFamily: integer #{index}")
end

unless File.directory? test_output
  FileUtils.mkdir_p test_output
end

Dir.chdir(test_output) do
  begin
    PTY.spawn(command) do |r, w, pid|
      r.each do |line|
        puts line
        _, date, time, tz, type, msg = line.match(/^(\d{4}-\d{2}-\d{2}) (\d{2}:\d{2}:\d{2}) ([+-]\d{4}) ([^:]+): (.*)$/).to_a

        case type
        when "Fail"
          failed = true
        end
      end
    end     
  rescue Errno::EIO
  rescue PTY::ChildExited => e
    STDERR.puts "Instruments exited unexpectedly" 
    exit 1
  end

  if failed
    STDERR.puts "#{test_script} failed, see log output for details"
    exit 1
  end
end
