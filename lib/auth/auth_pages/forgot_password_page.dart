import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/login.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25.0,
              ),
              _buildIcon(),
              SizedBox(
                height: _size.height * 0.09,
              ),
              _buildFormField(),
              _buildReturnLogin(),
              SizedBox(
                height: _size.height * 0.08,
              ),
              _buildForgetBtn(_size),
            ],
          ),
        ),
      ),
    );
  }

  _buildIcon() =>
      Lottie.asset('assets/img/authentication/forget_password.json');
  _buildFormField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextFormField(
          controller: emailController,
          cursorColor: Colors.white,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: "Email"),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) => email != null && !EmailValidator.validate(email)
              ? "Enter a valid email"
              : null,
        ),
      );
  _buildReturnLogin() => TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginWidget(),
          ),
        ),
        child: const Text('Return to login page'),
      );

  _buildForgetBtn(_size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SizedBox(
          height: _size.height * 0.07,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 1.0,
                primary: kPrimaryFrmColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
            onPressed: resetPassword,
            child: const Text('Reset Password'),
          ),
        ),
      );

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      // Message Content
      const message = SnackBar(
        content: Text("Reset Password Sent"),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    } on FirebaseAuthException catch (e) {
      final message = SnackBar(
        content: Text(e.message.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    }
  }
}
