import 'package:flutter/material.dart';

final kElevatedbtnprimary = ElevatedButton.styleFrom(
  primary: const Color(0xffFF9E44),
  onPrimary: Colors.black,
);

const kBtnPrimary = Color(0xffFF9E44);

const kCardDiscover = Color(0xffFF8181);
const kCardMyMood = Color(0xffEBB6B6);
const kCardMeditate = Color(0xffB8FF81);
const kCardMyDiary = Color(0xff75BEB1);
const kCardCounsellor = Color(0xffb2cca9);

// Onboarding Screen

final kbtnOnboarding = ElevatedButton.styleFrom(
  elevation: 0.0,
  primary: const Color(0xffFF9E44),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

const kTitle =
    TextStyle(fontSize: 18.0, letterSpacing: 1.0, fontWeight: FontWeight.bold);
const kDesc = TextStyle(fontSize: 14.0, letterSpacing: 1.0);
const kBtnFnt = TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.3);
