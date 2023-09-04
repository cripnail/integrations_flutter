import 'package:flutter/material.dart';
import 'package:js/js.dart';

import '../service.dart';
import 'platform_view_web.dart';

@JS()
external void sendTextToPlatform(String text);

class WebPlatformService implements PlatformService {
  @override
  void sendTextToPlatform(String text) {
    sendTextToPlatform(text);
  }

  Widget buildWebView() {
    return PlatformViewWeb();
  }
}