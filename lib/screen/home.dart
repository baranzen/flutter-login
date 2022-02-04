import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Home screen'),
      ),
      body: const Center(
        child: Text(
          'Home screen',
          style: TextStyle(fontSize: 36),
        ),
      ),
    );
  }
}
