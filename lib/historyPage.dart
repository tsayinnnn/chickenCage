import 'package:chicken/chickHistory.dart';
import 'package:chicken/tempHistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'historyPage.g.dart';

class HistoryRecords extends ConsumerStatefulWidget {
  const HistoryRecords({super.key});

  @override
  ConsumerState<HistoryRecords> createState() => _HistoryRecordsState();
}

class _HistoryRecordsState extends ConsumerState<HistoryRecords>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final tempHistories = ref.watch(GetHistoriesProvider('temp-hist'));
    final chickHistories = ref.watch(GetHistoriesProvider('chick-hist'));

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: const [
              // TODO: ! Maybe just use Texts??????
              FaIcon(FontAwesomeIcons.temperatureHalf),
              FaIcon(FontAwesomeIcons.temperatureArrowUp),
            ],
          ),
          SizedBox(height: 1.h),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // Temperature History
                tempHistories.when(
                  // When an error occur.
                  error: (error, stacktrace) =>
                      Center(child: Text("An error occured: $error")),

                  // While the history is fetched.
                  // Just shows 3 cards with a shimmer effect on them.
                  loading: () => generatePlaceholder(3),

                  // When history is fetched successfully.
                  data: (data) {
                    return TemperatureHistory(data);
                  },
                ),

                // Chicken Temperature History
                chickHistories.when(
                  // When an error occur.
                  error: (error, stacktrace) =>
                      Center(child: Text("An error occured: $error")),

                  // While the history is fetched.
                  // Just shows 3 cards with a shimmer effect on them.
                  loading: () => generatePlaceholder(3),

                  // When history is fetched successfully.
                  data: (data) {
                    return ChickHistory(data);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget generatePlaceholder(int length) {
  List<int> placeHolder = List.generate(length, (index) => index);
  return ListView.builder(
    itemCount: placeHolder.length,
    itemBuilder: (context, index) => Skeletonizer(
      enabled: true,
      child: Card(
        child: ListTile(
          title: Text('Lorem Ipsum ${placeHolder[index]}'),
          leading: Text('Lorem Ipsum ${placeHolder[index]}'),
          trailing: Text('Lorem Ipsum ${placeHolder[index]}'),
        ),
      ),
    ),
  );
}

@riverpod
Future<List<History>> getHistories(
  GetHistoriesRef ref,
  String collection,
) async {
  final firestore = FirebaseFirestore.instance;
  final collections = await firestore.collection(collection).get();
  final historyList = collections.docs
      .map(
        (doc) => History.fromSnapshot(doc),
      )
      .toList();
  return historyList;
}

class History {
  final String? status;
  final String temp;
  final String time;

  const History({
    this.status,
    required this.temp,
    required this.time,
  });

  factory History.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return History(
      status: snapshot.data()!['status'] ?? "",
      temp: snapshot.data()!['temp'],
      time: snapshot.data()!['time'],
    );
  }
}
