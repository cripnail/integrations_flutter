import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('com.example.native_integration/text_channel');
  final TextEditingController _textEditingController = TextEditingController();
  String _displayText = '';

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_handleMethodCall);
  }

  Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'updateText':
        setState(() {
          _displayText = call.arguments;
        });
        break;
      default:
        throw MissingPluginException();
    }
  }

  void _sendTextToPlatform() {
    String text = _textEditingController.text;
    platform.invokeMethod('setText', text);
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
                onPressed: _sendTextToPlatform,
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
