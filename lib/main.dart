import 'package:flutter/material.dart';

void main() {
  runApp(const DetectionCenterApp());
}

class DetectionCenterApp extends StatelessWidget {
  const DetectionCenterApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detection Center App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const (),
      debugShowCheckedModeBanner: false,
    );
  }
}

