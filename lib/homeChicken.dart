import 'dart:ffi';

import 'package:chicken/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeChicken extends StatefulWidget {
  HomeChicken({super.key});

  @override
  State<HomeChicken> createState() => _HomeChickenState();
}

class _HomeChickenState extends State<HomeChicken> {
  @override
  Widget build(BuildContext context) {
    final Reff = FirebaseDatabase.instance.ref();
    DatabaseReference isFanOn = Reff.child('data/fan');
    DatabaseReference isBulbOn = Reff.child('data/light');
    DatabaseReference temperatura = Reff.child('data/ambience');

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
              if (snapshot.hasError) {
                return Text("ERROR: ${snapshot.error}");
              }

              if (snapshot.hasData) {
                return Text(
                  "Ambience: ${snapshot.data!.snapshot.value.toString()}",
                  style: Theme.of(context).textTheme.labelLarge,
                );
              } else {
                return Text("Loading...");
              }
            },
          ),

          // fan and bulb status
          StreamBuilder(
            stream: isFanOn.onValue,
            builder: (context, snapshot) {
              bool stat = snapshot.data!.snapshot.value as bool;
              if (snapshot.hasError) {
                return Text("ERROR: ${snapshot.error}");
              }

              if (snapshot.hasData) {

                return Text(
                  "Fan Status: ${stat? "Active" : "Inactive"}",
                );
              } else {
                return Text("Loading...");
              }
            },
          ),
          StreamBuilder(
            stream: isBulbOn.onValue,
            builder: (context, snapshot) {
              bool stat = snapshot.data!.snapshot.value as bool;
              if (snapshot.hasError) {
                return Text("ERROR: ${snapshot.error}");
              }

              if (snapshot.hasData) {

                return Text(
                  "Light Bulb Status: ${stat? "Active" : "Inactive"}",
                );
              } else {
                return Text("Loading...");
              }
            },
          ),
         // Text("Fan Status: ${isFanOn ? "Active" : "Inactive"}"),
         // Text("Light Bulb Status: ${isBulbOn ? "Active" : "Inactive"}"),
          //history
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => historyRecords()));
              },
              child: Text("See Records"))
        ],
      ),
    ));
  }
}
