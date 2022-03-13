import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/login.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:email_validator/email_validator.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool connection = true;

  @override
  void initState() {
    super.initState();
// This will check if the user has a connection status
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connection = status == InternetConnectionStatus.connected;
      setState(() => this.connection = connection);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: connection
                ? Column(
                    children: [
                      _buildLottieIcon(),
                      _buildGreetings(),
                      SizedBox(
                        height: _size.height * 0.1,
                      ),
                      _buildEmailField(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildPasswordField(),
                              _buildAlreadyHaveAccount(),
                            ],
                          )),
                      SizedBox(
                        height: _size.height * 0.04,
                      ),
                      _buildCreateAccountBtn(_size),
                    ],
                  )
                : Lottie.asset('assets/img/authentication/no-internet.json')),
      ),
    );
  }

  _buildLottieIcon() =>
      Lottie.asset('assets/img/authentication/sign_up.json', width: 270.0);

  _buildGreetings() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          "Create your account",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30.0),
        ),
      );

  _buildEmailField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: "Email"),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) => email != null && !EmailValidator.validate(email)
              ? "Enter a valid email"
              : null,
        ),
      );
  _buildPasswordField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          controller: passwordController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: "Password"),
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value != null && value.length < 6
              ? "Enter min of 6 charters"
              : null,
        ),
      );

  _buildCreateAccountBtn(_size) => Padding(
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
            onPressed: _createAccount,
            child: const Text('Sign In'),
          ),
        ),
      );
  _buildAlreadyHaveAccount() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginWidget())),
              child: const Text('Already have an account'),
            )
          ],
        ),
      );

  Future _createAccount() async {
    Lottie.asset('assets/loading_indicator.json');
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trimLeft());
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavBarPage()));
    } on FirebaseAuthException catch (e) {
      final message = SnackBar(
        content: Text(e.message.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }
}
