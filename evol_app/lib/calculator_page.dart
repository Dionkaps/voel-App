import 'package:flutter/material.dart';

class CalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hides the back arrow button
        title: const Text('Magic Page'),
      ),
      body: const Center(
        child: Text('This is where all the magic happens'),
      ),
    );
  }
}