import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:umatter/models/onboarding_page_models/onboarding_info.dart';

class OnboardingController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
// PageController is a built-in widget
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo("assets/img/onboarding/preparation.json", 'Buckle Up',
        "Prepare yourself for the journey. Take the assessment and let’s find out what you’re going through "),
    OnboardingInfo("assets/img/onboarding/habit.json", 'Heads Up!',
        "Make your journey a habit. Take some space and explore freely on our recommendations."),
    OnboardingInfo("assets/img/onboarding/track.json", 'Keep It Up',
        "Stay on track of your journey.  3 weeks is all you need to check for your progress."),
  ];
}
