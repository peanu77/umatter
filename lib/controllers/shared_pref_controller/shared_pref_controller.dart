import 'package:shared_preferences/shared_preferences.dart';

class SharePrefConfig {
  onboardingPageInfoController() async {
    int isViewed = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt("onboarding", isViewed);
  }
}
