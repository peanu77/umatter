import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeditatePage extends StatelessWidget {
  const MeditatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}
