// requirements
var cordova = require('cordova');

// api object
var iOSDocumentPreview = {
  open: function (file, type, success, fail) {
    cordova.exec(success /* has opened */, fail, 'iOSDocumentPreview', 'open', [file, type]);
  }
};
// exporting only the open function; be directly used
module.exports = iOSDocumentPreview.open;
