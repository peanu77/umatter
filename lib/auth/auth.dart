// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:umatter/db/auth/auth_controller.dart';
// import 'package:umatter/db/auth/google_signin_auth_controller.dart';
// import 'package:umatter/views/authentication_page/create_account.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   bool isPasswordVisible = true;
//   @override
//   void initState() {
//     super.initState();
//     emailController.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: StreamBuilder(
//               stream: firebaseAuth.authStateChanges(),
//               builder: (context, snapshot) {
//                 return Column(
//                   children: [
//                     // Header
//                     SizedBox(
//                       height: _size.height * 0.25,
//                       width: double.infinity,
//                       // color: Colors.orange,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Spacer(
//                             flex: 2,
//                           ),
//                           Text(
//                             'Welcome Back!',
//                             style: TextStyle(
//                               fontSize: 30.0,
//                               letterSpacing: 1.0,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Spacer(),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 80.0),
//                             child: Text(
//                               'Welcome back, we\'ve missed you!',
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 letterSpacing: 1.0,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           Spacer(
//                             flex: 1,
//                           )
//                         ],
//                       ),
//                     ),
//                     // Form
//                     SizedBox(
//                       height: _size.height * 0.3,
//                       width: double.infinity,
//                       // color: Colors.green,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const Spacer(flex: 2),
//                           _buildFormInput(),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20.0, vertical: 5.0),
//                             child: TextButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 'Forget Password?',
//                                 style: TextStyle(letterSpacing: 1.0),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     // Button
//                     SizedBox(
//                       height: _size.height * 0.12,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: SizedBox(
//                                 height: _size.height * 0.08,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     AuthController.instance.login(
//                                         emailController.text,
//                                         passwordController.text);
//                                   },
//                                   // onPressed: ()=> onRead,
//                                   // onPressed: () {
//                                   //   signIn(
//                                   //     emailController.text.trim(),
//                                   //     passwordController.text.trim(),
//                                   //   );
//                                   // },
//                                   child: const Text(
//                                     'Sign In',
//                                     style: TextStyle(letterSpacing: 1.0),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                     primary: Colors.orange.shade700,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: _size.height * 0.15,
//                       width: double.infinity,
//                       child: Column(
//                         children: [
//                           const Divider(
//                             color: Colors.black,
//                             indent: 20.0,
//                             endIndent: 20.0,
//                           ),
//                           const Text('or continue using'),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 50.0,
//                               vertical: 15.0,
//                             ),
//                             child: SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   primary: Colors.white,
//                                   onPrimary: Colors.black,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   signInWithGoogle(context);
//                                 },
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     SizedBox(
//                                       height: 50.0,
//                                       width: 30.0,
//                                       child: SvgPicture.asset(
//                                           'assets/img/additional/google_icon.svg'),
//                                     ),
//                                     const Text('Continue with Google'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: _size.height * 0.07,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('Not yet a member?'),
//                           TextButton(
//                             onPressed: () => Get.to(
//                               () => const CreateAccountPage(),
//                             ),
//                             child: const Text('Create an Account'),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               }),
//         ),
//       ),
//     );
//   }

//   _buildFormInput() => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: emailController,
//               validator: (input) {
//                 if (input!.isEmpty) {
//                   return 'Please input email';
//                 }
//               },
//               keyboardType: TextInputType.emailAddress,
//               textInputAction: TextInputAction.done,
//               decoration: InputDecoration(
//                 suffixIcon: emailController.text.isEmpty
//                     ? Container(
//                         width: 0.0,
//                       )
//                     : IconButton(
//                         onPressed: () => emailController.clear(),
//                         icon: const Icon(Icons.close),
//                       ),
//                 labelText: "Email",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 hintText: "email@example.com",
//                 filled: true,
//                 fillColor: Colors.grey[300],
//               ),
//             ),
//             const SizedBox(
//               height: 20.0,
//             ),
//             /** Password */
//             TextFormField(
//               controller: passwordController,
//               validator: (input) {
//                 if (input!.length <= 6) {
//                   return "Password atleast 6";
//                 }
//               },
//               obscureText: isPasswordVisible,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 hintText: 'Password',
//                 labelText: "Password",
//                 filled: true,
//                 fillColor: Colors.grey[300],
//                 suffixIcon: IconButton(
//                     onPressed: () =>
//                         setState(() => isPasswordVisible = !isPasswordVisible),
//                     icon: isPasswordVisible
//                         ? const Icon(Icons.visibility_off)
//                         : const Icon(Icons.visibility)),
//               ),
//             ),
//           ],
//         ),
//       );

//   // Future signIn() async {
//   //   await firebaseAuth.signInWithEmailAndPassword(
//   //       email: emailController.text.trim(),
//   //       password: passwordController.text.trim());
//   // }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:umatter/views/welcome_page/user_info.dart';

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
          return const UserInfoPage();
        },
      ),
    );
  }
}
