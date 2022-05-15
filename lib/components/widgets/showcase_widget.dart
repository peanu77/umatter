import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

Widget customShowcase({required key, required desc, required Widget child}) {
  return Showcase(
    key: key,
    child: child,
    description: desc,
    overlayPadding: const EdgeInsets.all(5.0),
  );
}
