import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:umatter/models/onboarding_page_models/onboarding_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
// PageController is a built-in widget
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo("assets/img/onboarding_img/1.jpg", 'Title',
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
    OnboardingInfo("assets/img/onboarding_img/2.jpg", 'Title',
        "Lorem i sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  "),
    OnboardingInfo("assets/img/onboarding_img/3.jpg", 'Title',
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  "),
  ];
}
