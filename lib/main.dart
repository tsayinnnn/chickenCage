import 'package:chicken/firebase_options.dart';
import 'package:chicken/homeChicken.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Chicken());
}

class Chicken extends StatelessWidget {
  const Chicken({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: HomeChicken()
    );
  }
}