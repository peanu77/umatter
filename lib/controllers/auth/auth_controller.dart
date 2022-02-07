// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:umatter/views/authentication_page/login.dart';
// import 'package:umatter/views/dashboard_page/dashboard.dart';

// /// The AuthController is the one who navigate the pages
// class AuthController extends GetxController {
//   static AuthController instance = Get.find();

// // The user includes all the field the user inputted
//   late Rx<User?> _user;

//   /// We will be using the firebase auth for the authentication
//   FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   void onReady() {
//     super.onReady();
//     _user = Rx<User?>(auth.currentUser);

//     /// bind the user to the stream
//     _user.bindStream(auth.userChanges());

//     ///
//     ever(_user, _initialScreen);
//   }

//   _initialScreen(User? user) {
//     if (user == null) {
//       // print('Login Page');
//     } else {
//       Get.to(() => BottomNavBarPage());
//     }
//   }

//   void register(String email, password) async {
//     try {
//       await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return print("No user found");
//       }
//       if (e.code == 'email-already-in-use') {
//         print('Email is alread used');
//       }
//       if (e.code == 'invalid-email') {
//         Get.snackbar(
//           "About User",
//           "User Message",
//           // backgroundColor: Colors.orange,
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: const Text(
//             "Invalid Email",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         );
//       }
//       if (e.code == 'operation-not-allowed') {
//         print('Operation Not Allowed');
//       }
//       if (e.code == 'weak-password') {
//         print('Weak Password');
//       }
//     }
//   }

//   void login(String email, password) async {
//     try {
//       await auth.signInWithEmailAndPassword(email: email, password: password);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'invalid-email') {
//         Get.snackbar(
//           "About User",
//           "User Message",
//           // backgroundColor: Colors.orange,
//           snackPosition: SnackPosition.BOTTOM,
//           titleText: Text(
//             "$e",
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         );
//       }
//       if (e.code == 'user-not-found') {
//         print("User Not Found");
//       }
//       if (e.code == 'wrong-password') {
//         print('Invalid Password');
//       }
//       if (e.code == 'user-disabled') {
//         print('User has been Disabled');
//       }
//       // Get.snackbar(
//       //   "About Login",
//       //   "$e",
//       //   // backgroundColor: Colors.orange,
//       //   snackPosition: SnackPosition.BOTTOM,
//       //   titleText: const Text(
//       //     "Login Failed",
//       //     style: TextStyle(
//       //       color: Colors.black,
//       //     ),
//       //   ),
//       // );
//     }
//   }

//   Future<Future?> logout() async {
//     await auth.signOut();
//     return Get.to(LoginPage());
//   }
// }
