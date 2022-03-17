import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umatter/auth/auth_pages/login_page.dart';
import 'package:umatter/controllers/dashboard_controller/dashboard_binding.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/assessment_page/assessment_page.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/meditate/meditate_page.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';
import 'package:umatter/views/onboarding_screen/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umatter/views/user_info_page/user_page.dart';
import 'package:showcaseview/showcaseview.dart';

int? isViewed;
int? userScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Prevent the screen to rotate
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

// Shared Preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isViewed = sharedPreferences.getInt("onboarding");
  userScreen = await sharedPreferences.getInt("userScreen");

  await SharePrefConfig.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: const Color(0xff8cbbf1),
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => isViewed != 0 ? OnboardingPage() : const LogInPage(),
          binding: DashBoardBinding(),
        ),
        GetPage(name: '/login_page', page: () => const LogInPage()),
        GetPage(name: '/home_page', page: () => const NavBarPage()),
        GetPage(name: '/assessment', page: () => const AssessmentPage()),
        GetPage(name: '/user_info', page: () => const UserInfoPage()),
        GetPage(name: '/discover', page: () => const DiscoverPage()),
        GetPage(name: '/meditate', page: () => const MeditatePage()),
        GetPage(name: '/assessment', page: () => const AssessmentPage()),
        GetPage(
          name: '/my_diary',
          page: () => ShowCaseWidget(
              builder: Builder(builder: (_) => const MyDiaryPage())),
        ),
        GetPage(
            name: '/counselor',
            page: () => const ProfessionalDirectoriesPage()),
      ],
    );
  }
}
