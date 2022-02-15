import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MentalHealthCommunitiesPage extends StatefulWidget {
  const MentalHealthCommunitiesPage({Key? key}) : super(key: key);

  @override
  _MentalHealthCommunitiesPageState createState() =>
      _MentalHealthCommunitiesPageState();
}

class _MentalHealthCommunitiesPageState
    extends State<MentalHealthCommunitiesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mental Health Communities',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: const Center(
          child: Text(
            'Mental Health Communities',
          ),
        ),
      ),
    );
  }
}
