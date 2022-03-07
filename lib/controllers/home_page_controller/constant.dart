import 'package:flutter/material.dart';
import 'package:umatter/models/contants/constants.dart';

const kHomeCardPadding = EdgeInsets.symmetric(
  horizontal: 8.0,
  vertical: 5.0,
);
const kHomeCardStyle = TextStyle(
    fontWeight: FontWeight.bold, letterSpacing: 1.3, color: Colors.white);
const kHomeTitleStyle = TextStyle(
  letterSpacing: 1.3,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
const kCardContent = Color(0xffefedfa);
const kHomeBgColor = Color(0xffefedfa);

const kCardAssessment = Color(0xff4c93a1);
const kCardDiscover = Color(0xffa94a46);
const kCardMyMood = Color(0xffEBB6B6);
const kCardMeditate = Color(0xff584887);
const kCardMyDiary = Color(0xff75BEB1);
const kCardCounsellor = Color(0xffae23cb);

final kHomeButton = ElevatedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
  // primary: const Color(0xffFF9E44),
  primary: kBtnPrimary,
  onPrimary: Colors.black,
);
