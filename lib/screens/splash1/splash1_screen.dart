import 'package:flutter/material.dart';

class Splash1Screen extends StatelessWidget {
  const Splash1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
