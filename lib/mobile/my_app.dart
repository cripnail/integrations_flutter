import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../web/platform_view_web.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Native UI App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      // const MyHomePage(),
      kIsWeb ? const PlatformViewWeb() : const MyHomePage(),
    );
  }
}
