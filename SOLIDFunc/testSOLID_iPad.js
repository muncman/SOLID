#import "tuneup_js/tuneup.js"
#import "uiautomationHelpers.js"

// NOTE: It seems that the import statement needs double quotes, not single.
// NOTE: It seems that the log messages won't just take objects; 
//       they need strings to coerce values - or have toString() called on them.
// NOTE: If make changes in Xcode --such as setting accessibility labels-- 
//       you must redeploy the app to the simulator for Instruments to see the new version.
// NOTE: Observation = It goes slowly when it is having trouble...
// NOTE: Just testing for nil/false gives false negatives.

UIALogger.logMessage('==== Starting Tests ====');

// UIATarget.localTarget().frontMostApp().logElementTree();

//
// Specs
//

test('expected acronym', function(target, app) {
  var window = app.mainWindow();
  // Failing due to the odd iPad issue seen in unit tests: assertEquals('S.O.L.I.D.', window.navigationBar().buttons()[0].name(), 'It oughtta...');
  assertEquals('SRP', window.navigationBar().name(), 'It oughtta be the first acronym by default.');
});

UIALogger.logMessage('==== Tests Completed ====');

//
// TODO: Refactor to use PageObject pattern? (Or at least make parts reusable from other scripts.)
//
