import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class histTiles extends StatelessWidget {
  histTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right:15, bottom: 5),
      child: Card(
        child: ListTile(title: Text("Details: "),),
      ),
    );
  }
}