import 'dart:ffi';

import 'package:chicken/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeChicken extends StatefulWidget {
  HomeChicken({super.key});

  @override
  State<HomeChicken> createState() => _HomeChickenState();
}

class _HomeChickenState extends State<HomeChicken> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref();
    DatabaseReference isFanOn = ref.child('data/fan');
    DatabaseReference isBulbOn = ref.child('data/light');
    DatabaseReference temperatura = ref.child('data/ambience');

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //logo
          Image.asset('assets/chicken_logo.png'),
          //number of chicken
          StreamBuilder(
            stream: temperatura.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasError || snapshot.data == null) {
                return const Skeletonizer(
                  enabled: true,
                  child: Text("Loading..."),
                );
              }

              if (snapshot.hasData) {
                return Text(
                  "Ambience: ${snapshot.data!.snapshot.value.toString()}",
                  style: Theme.of(context).textTheme.labelLarge,
                );
              } else {
                return const Skeletonizer(
                  enabled: true,
                  child: Text("Loading..."),
                );
              }
            },
          ),

          // fan and bulb status
          StreamBuilder(
            stream: isFanOn.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasError || snapshot.data == null) {
                return const Skeletonizer(
                  enabled: true,
                  child: Text("Loading..."),
                );
              }

              bool stat = snapshot.data!.snapshot.value as bool;
              if (snapshot.hasData) {
                return Text(
                  "Fan Status: ${stat ? "Active" : "Inactive"}",
                );
              } else {
                return const Skeletonizer(
                  enabled: true,
                  child: Text("Loading..."),
                );
              }
            },
          ),
          StreamBuilder(
            stream: isBulbOn.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasError || snapshot.data == null) {
                return const Skeletonizer(
                  enabled: true,
                  child: Text("Loading..."),
                );
              }

              bool stat = snapshot.data!.snapshot.value as bool;
              if (snapshot.hasData) {
                return Text(
                  "Light Bulb Status: ${stat ? "Active" : "Inactive"}",
                );
              } else {
                return const Skeletonizer(
                  enabled: true,
                  child: Text("Loading..."),
                );
              }
            },
          ),

          //history
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryRecords(),
                  ),
                );
              },
              child: const Text("See Records"))
        ],
      ),
    ));
  }
}
