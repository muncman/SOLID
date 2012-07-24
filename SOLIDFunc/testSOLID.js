#import "tuneup_js/tuneup.js"

// NOTE: It seems that the import statement needs double quotes, not single.
// NOTE: It seems that the log messages won't just take objects; 
//       they need strings to coerce values - or have toString() called on them.
// NOTE: If make changes in Xcode --such as setting accessibility labels-- 
//       you must redeploy the app to the simulator for Instruments to see the new version.
// NOTE: Observation = It goes slowly when it is having trouble...
// NOTE: Just testing for nil/false gives false negatives.

UIALogger.logMessage('==== Starting Tests ====');

UIATarget.localTarget().frontMostApp().logElementTree();

function staticTextsContain(searchTexts, searchString) {
  var stringFound = false;
  for (var i=0; i<searchTexts.length; i=i+1) {
    UIALogger.logDebug('searchText for ' + i + ' is ' + searchTexts[i]);
    UIALogger.logDebug('searching for "' + searchString + '"');
    if (searchTexts[i] && searchTexts[i].value().indexOf(searchString) != -1) {
      stringFound = true;
      break;
    }
  }
  return stringFound;
}

//
// Specs
//

test('expected title', function(target, app) {
  var window = app.mainWindow();
  assertEquals('S.O.L.I.D.', window.navigationBar().name(), 'It oughtta...');
});

test('number of rows', function(target, app) {
  var window = app.mainWindow();
  assertEquals(5, window.tableViews()[0].cells().length, 'Should be one per principle.');
});

test('first table cell', function(target, app) {
  var window = app.mainWindow();
  UIALogger.logDebug('first cell name = ' + window.tableViews()[0].cells()[0].name());
  assertTrue('SRP' === window.tableViews()[0].cells()[0].name());
});

test('first detail screen', function(target, app) {
  var window = app.mainWindow();
  var firstCell = window.tableViews()[0].cells()[0];
  firstCell.tap();
  target.delay(2);
  assertTrue(staticTextsContain(window.staticTexts(), 'Single Responsibility Principle'), 'Should have this top label.');
});

UIALogger.logMessage('==== Tests Completed ====');

//
// TODO: Refactor to use PageObject pattern? (Or at least make parts reusable from other scripts.)
//
	