import '../service.dart';

// class PlatformServiceImpl implements PlatformService {
//   static const platform = methodChahhel('com.example.native_integration/text_channel');
// @override
//   //realize your override here
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../service.dart';
import 'my_home_page.dart';

class MobilePlatformService implements PlatformService {
  static const platform = MethodChannel('com.example.native_integration/text_channel');

  @override
  void sendTextToPlatform(String text) {
    platform.invokeMethod('setText', text);
  }

  Widget buildMobileView() {
    return MyHomePage();
  }
}