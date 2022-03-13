import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/auth_pages/create_account_page.dart';
import 'package:umatter/auth/auth_pages/forgot_password_page.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dialogs/privacy_and_terms.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SharePrefConfig sharePrefConfig = SharePrefConfig();

  bool hasInternet = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
// This will check if the user has a connection status
    InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() => this.hasInternet = hasInternet);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          children: [
            _buildIcon(),
            _buildWelcome(),
            const SizedBox(
              height: 20.0,
            ),
            _buildEmailForm(),
            const SizedBox(
              height: 15.0,
            ),
            _buildPasswordForm(),
            _buildCreateandForget(),
            const SizedBox(
              height: 20.0,
            ),
            _buildLoginBtn(_size),
            const SizedBox(
              height: 10.0,
            ),
            _buildGoogleBtn(_size),
            const SizedBox(height: 15.0),
            _buildTermsandConditions(),
          ],
        )
            // : Lottie.asset(
            //     'assets/no-internet.json',
            //   )),
            ),
      ),
    );
  }

  _buildIcon() =>
      Lottie.asset('assets/img/authentication/welcome.json', width: 270.0);

  _buildWelcome() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          "Welcome Back! you've been missed",
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
  _buildGoogleBtn(_size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          width: double.infinity,
          height: _size.height * 0.07,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            onPressed: () => _googleLogin(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FaIcon(FontAwesomeIcons.google),
                const Text('Google Sign In'),
                Container(),
              ],
            ),
          ),
        ),
      );

  _buildTermsandConditions() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => const TermsandPolicyDialogPage()),
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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      sharePrefConfig.onboardingPageInfoController();
    } on FirebaseAuthException catch (e) {
      final message = SnackBar(
        content: Text(e.message.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }

  Future _googleLogin() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
