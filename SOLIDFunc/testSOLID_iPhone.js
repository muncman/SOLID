#import "tuneup_js/tuneup.js"
#import "uiautomationHelpers.js"

UIALogger.logMessage('==== Starting Tests ====');

//
// Specs
//

test('expected title', function(target, app) {
 var window = app.mainWindow();
 assertEquals('SRP', window.navigationBar().name(), 'It oughtta be the first acronym by default.');
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
