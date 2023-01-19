import 'package:flutter/material.dart';

class Splash2Screen extends StatelessWidget {
  const Splash2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
