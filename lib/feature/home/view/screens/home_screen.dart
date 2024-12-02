import 'package:flutter/material.dart';

import '../widgets/body_of_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: BodyOfHomeWidget(),
      ),
    );
  }
}
