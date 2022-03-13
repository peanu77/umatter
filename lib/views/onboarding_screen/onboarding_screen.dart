import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/auth_pages/login_page.dart';
import 'package:umatter/controllers/onboarding_screen_controller/onboarding_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:umatter/views/onboarding_screen/constants/constant.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);
  final _controller = OnboardingController();
  final sharedPref = SharePrefConfig();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller.pageController,
            onPageChanged: _controller.selectedPageIndex,
            itemCount: _controller.onboardingPages.length,
            itemBuilder: (context, index) {
              return SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: _size.height * 0.4,
                      child: Lottie.asset(
                          _controller.onboardingPages[index].imgAsset),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      height: _size.height * 0.46,
                      decoration: const BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.0),
                          topLeft: Radius.circular(25.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _controller.onboardingPages.length,
                              (index) => Obx(
                                () {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                    width:
                                        _controller.selectedPageIndex.value ==
                                                index
                                            ? 25
                                            : 8,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      color:
                                          _controller.selectedPageIndex.value ==
                                                  index
                                              ? Colors.orange.shade500
                                              : Colors.orangeAccent[100],
                                      borderRadius: BorderRadius.circular(
                                        15.0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _controller.onboardingPages[index].title,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              _controller.onboardingPages[index].description,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          const Spacer(),

                          /// When the user reached the last index or page it will change the button Next into Get Started.
                          Obx(
                            () {
                              return _controller.isLastPage
                                  ? SizedBox(
                                      width: _size.width * 0.8,
                                      height: _size.height * 0.075,
                                      child: ElevatedButton(
                                        style: kbtnOnboarding,
                                        onPressed: () {
                                          nextPageController() async {
                                            // Using the Getx package or module we use the Get.to to navigate to the homepage instead of the native way of navigating in flutter.
                                            if (_controller.isLastPage ==
                                                true) {
                                              await sharedPref
                                                  .onboardingPageInfoController();
                                              Get.offAllNamed('/login_page');
                                            } else {
                                              _controller.pageController
                                                  .nextPage(
                                                      duration:
                                                          300.milliseconds,
                                                      curve: Curves.easeIn);
                                            }
                                          }

                                          nextPageController();
                                        },
                                        child: Obx(() {
                                          return Text(
                                            _controller.isLastPage
                                                ? 'Get Started'
                                                : 'Next',
                                            style: kBtnFnt,
                                          );
                                        }),
                                      ),
                                    )
                                  : Align(
                                      alignment: Alignment.bottomCenter,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          nextPageController() async {
                                            if (_controller.isLastPage ==
                                                true) {
                                              // Navigator.pushNamedAndRemoveUntil(
                                              //     context,
                                              //     "/home_page",
                                              //     (route) => false);
                                              // Get.to(
                                              //   () => const NavBarPage(),
                                              // );
                                              // await sharedPref
                                              //     .onboardingPageInfoController;
                                              Get.offAllNamed('/home_page');
                                            } else {
                                              _controller.pageController
                                                  .nextPage(
                                                      duration:
                                                          300.milliseconds,
                                                      curve: Curves.easeIn);
                                            }
                                          }

                                          nextPageController();
                                        },
                                        child: const Icon(
                                          Icons.chevron_right,
                                          color: Colors.black,
                                        ),
                                        backgroundColor: kBtnPrimary,
                                      ),
                                    );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
