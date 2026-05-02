import 'package:dislexic/core/ocr/ocr_service.dart';
import 'package:dislexic/providers/home_provider.dart';
import 'package:dislexic/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _textRecognizer = MLKitTextRecognizer();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dyslexic reader',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
        fontFamily: 'OpenDyslexic'
        
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeProvider(_textRecognizer),
        child: HomeScreen(),
      ),
    );
  }
}
