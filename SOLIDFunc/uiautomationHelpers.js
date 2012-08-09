// UIAutomation Helper Functions

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