import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/auth/auth_controller.dart';
import 'package:umatter/views/authentication_page/login.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String password = "";

  bool isPasswordVisible = true;
  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              SizedBox(
                height: _size.height * 0.25,
                width: double.infinity,
                // color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(
                      flex: 2,
                    ),
                    Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        'Please provide us the information needed below.',
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
              // Form
              SizedBox(
                height: _size.height * 0.3,
                width: double.infinity,
                // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(flex: 2),
                    _buildFormInput(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: TextButton(
                        onPressed: () => Get.to(() => const LoginPage()),
                        child: const Text(
                          'Already have an account',
                          style: TextStyle(letterSpacing: 1.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Button
              SizedBox(
                // color: Colors.blueGrey,
                height: _size.height * 0.12,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          height: _size.height * 0.08,
                          child: ElevatedButton(
                            // onPressed: () => AuthController.instance.register(
                            //   emailController.text.trim(),
                            //   passwordController.text.trim(),
                            // ),
                            onPressed: () {},
                            child: const Text(
                              'Sign In',
                              style: TextStyle(letterSpacing: 1.0),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Colors.orange.shade700,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildFormInput() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                suffixIcon: emailController.text.isEmpty
                    ? Container(
                        width: 0.0,
                      )
                    : IconButton(
                        onPressed: () => emailController.clear(),
                        icon: const Icon(Icons.close),
                      ),
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "email@example.com",
                filled: true,
                fillColor: Colors.grey[300],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            /** Password */
            TextField(
              controller: passwordController,
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Password',
                labelText: "Password",
                filled: true,
                fillColor: Colors.grey[300],
                suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => isPasswordVisible = !isPasswordVisible),
                    icon: isPasswordVisible
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
              ),
            ),
          ],
        ),
      );
}
