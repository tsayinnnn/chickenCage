import 'package:chicken/historyTiles.dart';
import 'package:flutter/material.dart';


class historyRecords extends StatelessWidget {
  historyRecords({super.key});
  final List<String> items =  List<String>.generate(5, (i) => "Item${i+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History"),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder:(context, index){
          return histTiles();
        }
      )
      

    );
  }
}