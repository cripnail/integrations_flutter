import 'package:flutter/material.dart';

class PlatformViewWeb extends StatelessWidget {
  const PlatformViewWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: HtmlElementView(viewType: 'web-button', onPlatformViewCreated: _onPlatformViewCreated),
    );
  }

  _onPlatformViewCreated(int id) {
    print('PlatformView with id: $id created');
  }
}
