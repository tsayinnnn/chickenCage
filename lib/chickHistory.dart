import 'package:chicken/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChickHistory extends ConsumerWidget {
  const ChickHistory(this.data, {super.key});

  final List<History> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      // Refresh Functionality
      onRefresh: () async {
        ref.invalidate(GetHistoriesProvider('chick-hist'));
      },
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final history = data[index];
          return Card(
            child: ListTile(
              // Temperature
              title: Text('${history.temp}°C'),

              // Timestamp on when it happened
              trailing: Text(history.time),
            ),
          );
        },
      ),
    );
  }
}
