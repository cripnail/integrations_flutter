import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformViewMobile extends StatelessWidget {
  const PlatformViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      view = AndroidView(
          viewType: 'INTEGRATION_ANDROID', onPlatformViewCreated: _onPlatformViewCreated);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      view = UiKitView(viewType: 'INTEGRATION_IOS', onPlatformViewCreated: _onPlatformViewCreated);
    } else {
      view = Text('$defaultTargetPlatform is not supported');
    }
    return SizedBox(height: 50, width: 200, child: view);
  }

  _onPlatformViewCreated(int id) {
    print('PlatformView with id: $id created');
  }
}
