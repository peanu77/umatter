import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:umatter/auth/auth_pages/login_page.dart';
import 'package:umatter/controllers/onboarding_screen_controller/onboarding_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/assessment_page/const.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = OnboardingController();
  final pageController = PageController();
  final sharedPref = SharePrefConfig();
  bool isLastPage = false;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              buildPage(
                img: _controller.onboardingPages[0].img,
                title: _controller.onboardingPages[0].title,
                subtitle: _controller.onboardingPages[0].desc,
              ),
              buildPage(
                img: _controller.onboardingPages[1].img,
                title: _controller.onboardingPages[1].title,
                subtitle: _controller.onboardingPages[1].desc,
              ),
              buildPage(
                img: _controller.onboardingPages[2].img,
                title: _controller.onboardingPages[2].title,
                subtitle: _controller.onboardingPages[2].desc,
              ),
            ],
          ),
        ),
        bottomSheet: SizedBox(
          height: _size.height * 0.18,
          child: Column(
            children: [
              // Slider
              Container(
                padding: const EdgeInsets.all(20.0),
                // color: Colors.orange,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: _controller.onboardingPages.length,
                    effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: kprimayColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Button
              isLastPage
                  ? ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LogInPage()));
                        await sharedPref.onboardingPageInfoController();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 20.0),
                        primary: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Get Started'),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                            shape: const CircleBorder(),
                            primary: Colors.orangeAccent,
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(
      {required String img, required String title, required String subtitle}) {
    return Column(children: [
      // Image
      Container(
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height * 0.45,
        child: Lottie.asset(img),
      ),

      const Spacer(),
      // title
      Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
      const Spacer(),
      // subtitle
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          subtitle,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
      ),
      const Spacer(),
    ]);
  }
}
