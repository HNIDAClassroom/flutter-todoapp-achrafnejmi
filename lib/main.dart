import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todolistflutterapp/firebase_options.dart';
import 'package:todolistflutterapp/widgets/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: true,
      ),
      home: const MyApp(),
    ),
  );
}
