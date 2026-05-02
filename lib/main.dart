import 'package:dislexic/providers/home_provider.dart';
import 'package:dislexic/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dislexic reader',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: HomeScreen(),
      ),
    );
  }
}
