import 'package:flutter/material.dart';
import 'package:js/js.dart';

@JS('sendTextToPlatform')
external void _sendTextToPlatform(String text);

@JS('getTextFromPlatform')
external String _getTextFromPlatform();

class PlatformViewWeb extends StatefulWidget {
  const PlatformViewWeb({Key? key}) : super(key: key);

  @override
  _PlatformViewWebState createState() => _PlatformViewWebState();
}

class _PlatformViewWebState extends State<PlatformViewWeb> {
  final TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';

  void _updateTextFromPlatform() {
    setState(() {
      _displayText = _getTextFromPlatform();
    });
  }

  void _sendText() {
    String text = _textEditingController.text;
    _sendTextToPlatform(text);
    _updateTextFromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native UI App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Enter Text',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _sendText,
                child: const Text('Send Text'),
              ),
              const SizedBox(height: 16),
              Text(
                'Received Text: $_displayText',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'dart:js' as js;
// import 'package:flutter/material.dart';
//
// class PlatformViewWeb extends StatefulWidget {
//   const PlatformViewWeb({Key? key}) : super(key: key);
//
//   @override
//   _PlatformViewWebState createState() => _PlatformViewWebState();
// }
//
// class _PlatformViewWebState extends State<PlatformViewWeb> {
//   final TextEditingController _textEditingController = TextEditingController();
//   String _displayText = '';
//
//   void _updateTextFromPlatform() {
//     setState(() {
//       _displayText = js.context.callMethod('getTextFromPlatform');
//     });
//   }
//
//   void _sendText() {
//     String text = _textEditingController.text;
//     js.context.callMethod('sendTextToPlatform', [text]);
//     _updateTextFromPlatform();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _updateTextFromPlatform(); // Initialize the displayed text
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 0.28),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _textEditingController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter Text',
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _sendText,
//               child: const Text('Send Text'),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Received Text: $_displayText',
//               style: const TextStyle(fontSize: 18),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
