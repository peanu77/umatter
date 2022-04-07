import 'package:flutter/cupertino.dart';

class CampusInfoPage {
  String title;
  String subtitle;
  Color color;
  final String imgAsset;
  final route;
  CampusInfoPage({
    required this.imgAsset,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.route,
  });
}
