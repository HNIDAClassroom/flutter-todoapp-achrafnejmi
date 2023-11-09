import 'package:flutter/material.dart';
import 'package:todolistflutterapp/tasks.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: true,
      ),
      home: const Tasks(),
    ),
  );
}
