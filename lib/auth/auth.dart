import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:umatter/views/user_info_page/user_info_page.dart';

int? isViewed;

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(clientId: ''),
              ],
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(action == AuthAction.signIn
                      ? "By signing in, you agree to our terms and conditions."
                      : "By registering, you agree to our terms and conditions."),
                );
              },
              footerBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        // onPressed: () {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) => PolicyDialogPage(
                        //           mdFileName: 'terms_and_condition.md'));
                        // },
                        child: const Text('Terms and Condition'),
                      ),
                      const Text('and'),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Privacy and Policy'),
                      )
                    ],
                  ),
                );
              },
            );
          }
          return UserInfoPage();
          // return const UserInfoPage();
        },
      ),
    );
  }

  Future<void> setData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isViewed = sharedPreferences.getInt("signedIn");
  }
}
