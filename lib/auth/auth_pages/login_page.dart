import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/auth_pages/create_account_page.dart';
import 'package:umatter/auth/auth_pages/forgot_password_page.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SharePrefConfig sharePrefConfig = SharePrefConfig();
  late TabController _tabController;
  final databaseController = DatabaseManager();

  bool connection = true;
  bool isShow = true;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Terms and Conditions'),
    Tab(text: 'Privacy and Policy'),
  ];

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
  void dispose() {
    _tabController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: connection
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      _buildIcon(),
                      _buildWelcome(),
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
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                      'assets/img/authentication/no-internet.json')),
        ),
      ),
    );
  }

  _buildIcon() =>
      Lottie.asset('assets/img/authentication/welcome.json', width: 240.0);

  _buildWelcome() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Text(
          "Welcome Back! you've been missed",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0),
        ),
      );

  _buildEmailForm() => TextField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(labelText: "Email"),
      );
  _buildPasswordForm() => TextField(
        controller: passwordController,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
            onPressed: () => setState(() => isShow = !isShow),
            icon: isShow
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility_outlined),
          ),
        ),
        obscureText: isShow,
      );

  _buildCreateandForget() => Row(
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
      );

  _buildLoginBtn(_size) => SizedBox(
        width: double.infinity,
        height: _size.height * 0.07,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1.0,
              primary: kPrimaryFrmColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          onPressed: () {
            databaseController.signIn(
                emailController, passwordController, context, sharePrefConfig);
          },
          child: const Text('Sign In'),
        ),
      );

  _buildGoogleBtn(_size) => SizedBox(
        width: double.infinity,
        height: _size.height * 0.07,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              )),
          onPressed: () {
            databaseController.googleLogin();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const FaIcon(FontAwesomeIcons.google),
              const Text('Google Sign In'),
              Container(),
            ],
          ),
        ),
      );

  _buildTermsandConditions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _buildDialog(),
          child: const Text('Terms and Conditions'),
        ),
        const Text('and'),
        TextButton(
          onPressed: () => _buildDialog(),
          child: const Text('Privacy and Policy'),
        )
      ],
    );
  }

  _buildDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Container(
          height: 30.0,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.grey[600],
          ),
          child: Row(
            children: [
              TabBar(
                controller: _tabController,
                tabs: myTabs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
