//var textValue = "";
//
//function setTextValue(text) {
//    textValue = text;
//}
//
//function sendTextToPlatform() {
//    if (window.flutter_inappwebview) {
//        window.flutter_inappwebview.callHandler('sendTextToPlatform', textValue);
//    }
//}
//
//let storedText = "";
//
//function sendTextToPlatform(text) {
//  storedText = text;
//  // any other logic you want when sending text to the platform
//}
//
//function getTextFromPlatform() {
//  return storedText;
//}
let storedText = "";

function sendTextToPlatform(text) {
  storedText = text;
  // any other logic you want when sending text to the platform
}

function getTextFromPlatform() {
  return storedText;
}


