import 'package:flutter/material.dart';

class GlobalLoadingScreen extends StatelessWidget {
  const GlobalLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
