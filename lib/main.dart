import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/cat_facts/screens/cat_fact_screen.dart';

void main() {
  runApp(const AppEntry());
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Cat Facts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CatFactScreen(),
      ),
    );
  }
}
