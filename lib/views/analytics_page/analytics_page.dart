import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late List<Assessment> _chartData;
  late TooltipBehavior _tooltipBehavior;

  final Stream users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  void initState() {
    _chartData = getAssessment;
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfCircularChart(
          // Chart Title
          title: ChartTitle(
            // Title
            text: 'Pre-Assessment Result',
          ),
          legend: Legend(
              isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<Assessment, String>(
              dataSource: _chartData,
              // x and y value mapper
              xValueMapper: (Assessment data, _) => data.gender,
              yValueMapper: (Assessment data, _) => data.age,
              // Enable Data Labels
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            )
          ],
        ),
      ),
    );
  }

  List<Assessment> getAssessment = [
    Assessment(
      name: "Angelo",
      gender: "Male",
      age: 34,
    ),
    Assessment(
      name: "Jenny",
      gender: "Female",
      age: 14,
    ),
    Assessment(
      name: "Edricha",
      gender: "Female",
      age: 21,
    ),
    Assessment(
      name: "Aelexis",
      gender: "Female",
      age: 21,
    ),
  ];
}

class Assessment {
  final String name;
  final String gender;
  final int age;
  Assessment({
    required this.name,
    required this.gender,
    required this.age,
  });
}
