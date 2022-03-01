import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umatter/auth/auth.dart';
import 'package:umatter/controllers/dashboard_controller/dashboard_binding.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/meditate/meditate.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';
import 'package:umatter/views/onboarding_screen/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';

int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  isViewed = sharedPreferences.getInt("onboarding");
  isViewed = sharedPreferences.getInt("user_info");
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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(24),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),

        textTheme: GoogleFonts.montserratTextTheme(),
        primaryColor: const Color(0xff8cbbf1),
        // primarySwatch: Colors.orange.shade200,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          // This automatically load the homepage or the first index in the our navigation bar
          name: '/',
          // This will check if the user has already visited the app before if not the app will be loaded with OnboardingPage otherwise it will load the HomePage.
          page: () => isViewed != 0 ? OnboardingPage() : const LogInPage(),
          binding: DashBoardBinding(),
        ),
        GetPage(
          name: '/discover',
          page: () => const DiscoverPage(),
        ),
        GetPage(
          name: '/meditate',
          page: () => const MeditatePage(),
        ),
        GetPage(
          name: '/my_diary',
          page: () => const MyDiaryPage(),
        ),
        GetPage(
          name: '/counselor',
          page: () => const ProfessionalDirectoriesPage(),
        ),
      ],
    );
  }
}
