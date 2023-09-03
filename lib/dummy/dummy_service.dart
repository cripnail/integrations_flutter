// import 'package:flutter/material.dart';
//
// class DummyService extends StatelessWidget {
//   const DummyService({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Text('Platform is not found');
//   }
// }
import 'package:flutter/material.dart';

class DummyService {
  Widget buildDummyView() {
    return Center(
      child: Text('Platform is not supported'),
    );
  }
}