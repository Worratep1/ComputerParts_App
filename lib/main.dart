import 'package:flutter/material.dart';
// import 'AddPage.dart'; // ลบบรรทัดนี้
import 'HomePage.dart';

void main() {
  runApp(ComputerPartsApp());
}

class ComputerPartsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ComputerParts_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
