import 'package:flutter/material.dart';
import 'package:flutter_inputs/text_field_istemleri.dart';
import 'package:flutter_inputs/text_from_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const TextFormFieldKullanimi(),
    );
  }
}
