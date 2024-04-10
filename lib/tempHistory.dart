import 'package:chicken/historyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TemperatureHistory extends ConsumerWidget {
  const TemperatureHistory(this.data, {super.key});

  final List<History> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      // Refresh Functionality
      onRefresh: () async {
        ref.invalidate(GetHistoriesProvider('temp-hist'));
      },
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final history = data[index];
          return Card(
            child: ListTile(
              // Status of what happened
              title: Text(history.status ?? ""),

              // Temperature
              leading: Text('${history.temp}°C'),

              // Timestamp on when it happened
              trailing: Text(history.time),
            ),
          );
        },
      ),
    );
  }
}
