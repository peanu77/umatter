import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Users Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
