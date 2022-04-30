import 'package:shared_preferences/shared_preferences.dart';

class SharePrefConfig {
  onboardingPageInfoController() async {
    int isViewed = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt("onboarding", isViewed);
  }

  userInfoController() async {
    int isDisplayed = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setInt('user_info', isDisplayed);
  }

  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;

  static const _keyUsername = 'username';
  static const _keyAge = 'age';
  static const _keyGender = 'gender';
  static const _keyCivilStatus = 'civilstatus';
  static const _keyReason = 'reasonList';
  static const _keyEmotions = 'emotions';
  static const _keySelectedColor = 'selectedColor';
  static const _keyAssessment = 'assessment';
  static const _keyAssessmentScore = 'assessmentScore';
  static const _keyTrueorFalseScore = 'trueorfalseScore';
  static const _keyTrueorMultipleChoiceScore = 'multiplechoiceScore';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // Username
  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);

  static String? getUsername() => _preferences.getString(_keyUsername);

  // Age
  static Future setAge(String age) async =>
      await _preferences.setString(_keyAge, age);

  static String? getAge() => _preferences.getString(_keyAge);

  // Gender
  static Future setGender(String gender) async =>
      await _preferences.setString(_keyGender, gender);

  static String? getGender() => _preferences.getString(_keyGender);

  // Civil Status
  static Future setCivilStatus(String civilstatus) async =>
      await _preferences.setString(_keyCivilStatus, civilstatus);

  static String? getCivilStatus() => _preferences.getString(_keyCivilStatus);

// Reasons
  static Future setReasons(List<String> reasonList) async =>
      await _preferences.setStringList(_keyReason, reasonList);

  static List<String>? getReasons() => _preferences.getStringList(_keyReason);

// Emojis
  static Future setEmoji(String emotions) =>
      _preferences.setString(_keyEmotions, emotions);

  static String? getEmoji() => _preferences.getString(_keyEmotions);

// Selected Colors

  static Future setSelectedColor(String selectedColor) async =>
      await _preferences.setString(_keySelectedColor, selectedColor);

  static String? getSelectedColor() =>
      _preferences.getString(_keySelectedColor);

  //  Assessment
  static Future setAssessment(List<String> assessment) async =>
      await _preferences.setStringList(_keyAssessment, assessment);

  static List<String>? getAssessment() =>
      _preferences.getStringList(_keyAssessment);
  // _preferences.getIntList(_keyAssessment);

  // Assessment Score
  static Future setAssessmentScore(String assessmentScore) async =>
      await _preferences.setString(_keyAssessmentScore, assessmentScore);

  static String? getAssessmentScore() =>
      _preferences.getString(_keyAssessmentScore);

  // True or false Score
  static Future setTrueorFalse(String trueorfalseScore) async =>
      await _preferences.setString(_keyTrueorFalseScore, trueorfalseScore);

  static String? getTrueofFalse() =>
      _preferences.getString(_keyAssessmentScore);

  // Multiple Choice Score
  static Future setMultipleChoice(String multiplechoiceScore) async =>
      await _preferences.setString(
          _keyTrueorMultipleChoiceScore, multiplechoiceScore);

  static String? getMultipleChoice() =>
      _preferences.getString(_keyTrueorMultipleChoiceScore);
}
