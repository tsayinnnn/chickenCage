import 'package:chicken/firebase_options.dart';
import 'package:chicken/homeChicken.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: ResponsiveSizer(
        builder: (context, orientation, type) => const Chicken(),
      ),
    ),
  );
}

class Chicken extends StatelessWidget {
  const Chicken({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeChicken(),
    );
  }
}
