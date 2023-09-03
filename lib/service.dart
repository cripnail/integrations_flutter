// import 'package:flutter/foundation.dart';
// import 'package:native_integration/web/web_service.dart';
//
// import 'dummy/dummy_service.dart'
// if (dart.library.html) 'web/web_service.dart'
// if (dart.library.io) 'mobile/mobile_service.dart';
//
// abstract class PlatformService {
//     void performAction();
// }
//
// PlatformService getPlatformService() {
//     if (kIsWeb) {
//         return WebPlatformService();
//     } else {
//         return MobilePlatformService();
//     }
// }
import 'package:flutter/foundation.dart';

import 'dummy/dummy_service.dart'
if (dart.library.html) 'web/web_service.dart'
if (dart.library.io) 'mobile/mobile_service.dart';

abstract class PlatformService {
    void sendTextToPlatform(String text);
}