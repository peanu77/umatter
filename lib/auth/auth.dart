// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutterfire_ui/auth.dart';
// import 'package:umatter/views/user_info_page/user_page.dart';
// import 'package:get/get.dart';

// class LogInPage extends StatelessWidget {
//   const LogInPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return SignInScreen(
//               providerConfigs: const [
//                 EmailProviderConfiguration(),
//                 GoogleProviderConfiguration(clientId: ''),
//               ],
//               subtitleBuilder: (context, action) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10.0),
//                   child: Text(action == AuthAction.signIn
//                       ? "By signing in, you agree to our terms and conditions."
//                       : "By registering, you agree to our terms and conditions."),
//                 );
//               },
//               footerBuilder: (context, action) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10.0),
//                   child: Row(
//                     children: [
//                       TextButton(
//                         onPressed: () {},
//                         // onPressed: () {
//                         //   showDialog(
//                         //       context: context,
//                         //       builder: (context) => PolicyDialogPage(
//                         //           mdFileName: 'terms_and_condition.md'));
//                         // },
//                         child: const Text('Terms and Condition'),
//                       ),
//                       const Text('and'),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text('Privacy and Policy'),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//           Get.toNamed('/assessment');
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/auth_pages/create_account_page.dart';
import 'package:umatter/auth/auth_pages/forgot_password_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _size.height * 0.07,
              ),
              _buildIcon(),
              _buildWelcome(),
              SizedBox(
                height: _size.height * 0.05,
              ),
              _buildEmailForm(),
              const SizedBox(
                height: 15.0,
              ),
              _buildPasswordForm(),
              _buildCreateandForget(),
              SizedBox(
                height: _size.height * 0.06,
              ),
              _buildLoginBtn(_size),
              _buildTermsandConditions(),
            ],
          ),
        ),
      ),
    );
  }

  _buildIcon() => Lottie.asset('assets/welcome.json', width: 270.0);

  _buildWelcome() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          "Welcome Back!, you've been missed",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.0),
        ),
      );

  _buildEmailForm() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: "Email"),
        ),
      );
  _buildPasswordForm() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          controller: passwordController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: "Password"),
          obscureText: true,
        ),
      );

  _buildCreateandForget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CreateAccountPage())),
              child: const Text('Create an Account'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgetPasswordPage())),
              child: const Text('Forget Password'),
            )
          ],
        ),
      );

  _buildLoginBtn(_size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          width: double.infinity,
          height: _size.height * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 1.0,
                primary: kPrimaryFrmColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            onPressed: _signIn,
            child: const Text('Sign In'),
          ),
        ),
      );
  _buildTermsandConditions() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text('Terms and Conditions'),
          ),
          const Text('and'),
          TextButton(
            onPressed: () {},
            child: const Text('Privacy and Policy'),
          )
        ],
      );

  Future _signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
