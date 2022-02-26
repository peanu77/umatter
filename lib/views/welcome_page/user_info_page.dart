// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:umatter/views/assessment_page/assessment_page.dart';
// import 'package:umatter/views/user_info_page/user_info.dart';
// import 'package:umatter/views/welcome_page/welcome_page.dart';

// class UserInformationPage extends StatefulWidget {
//   const UserInformationPage({Key? key}) : super(key: key);

//   @override
//   _UserInformationPageState createState() => _UserInformationPageState();
// }

// class _UserInformationPageState extends State<UserInformationPage> {
//   final _formKey = GlobalKey<FormState>();

//   int currentStep = 0;
//   final usernameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController statusController = TextEditingController();
//   final genderList = ["Male", "Female", "Others"];
//   String gender = '';
//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Theme(
//           data: Theme.of(context).copyWith(
//               colorScheme:
//                   const ColorScheme.light(primary: Colors.orangeAccent)),
//           child: Stepper(
//             elevation: 0.0,
//             onStepContinue: () {
//               final isLastStep = currentStep == _buildSteps(_size).length - 1;
//               if (isLastStep) {
//                 // Send data to firestore
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => const AssessmentPage(),
//                   ),
//                 );
//                 print(
//                     """ $usernameController, $ageController, $gender, $statusController
// """);
//                 print("Last Step");
//               } else {
//                 setState(() {
//                   currentStep += 1;
//                 });
//               }
//             },
//             onStepCancel: () {
//               currentStep == 0
//                   ? null
//                   : setState(() {
//                       currentStep -= 1;
//                     });
//             },
//             currentStep: currentStep,
//             type: StepperType.horizontal,
//             steps: _buildSteps(_size),
//             controlsBuilder: ((context, controller) => Container(
//                   margin: EdgeInsets.only(top: 50),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: controller.onStepContinue,
//                           child: const Text("Continue"),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 15.0,
//                       ),
//                       if (currentStep != 0)
//                         Expanded(
//                           child: ElevatedButton(
//                             onPressed: controller.onStepCancel,
//                             child: const Text("Back"),
//                           ),
//                         ),
//                     ],
//                   ),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }

//   _buildSteps(_size) {
//     return [
//       Step(
//         state: currentStep > 0 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 0,
//         title: const Text("Username"),
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(
//               height: 100.0,
//             ),
//             Text(
//               'So nice to meet you! What do your friends call you?',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const SizedBox(
//               height: 150.0,
//             ),
//             TextFormField(
//               controller: usernameController,
//               decoration: InputDecoration(
//                 label: const Text('UserName'),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//               ),
//               // onChanged: (value) => username = value,
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return "Enter a valid username";
//                 }
//                 if (value.length > 10) {
//                   return "Username too long!";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             const SizedBox(
//               height: 100.0,
//             ),
//           ],
//         ),
//       ),
//       Step(
//         state: currentStep > 1 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 1,
//         title: const Text("Age"),
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(
//               height: 100.0,
//             ),
//             Text(
//               'So nice to meet you! What do your friends call you?',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const SizedBox(
//               height: 150.0,
//             ),
//             TextFormField(
//               controller: ageController,
//               decoration: InputDecoration(
//                 label: const Text('Age'),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(
//               height: 100.0,
//             ),
//           ],
//         ),
//       ),
//       Step(
//           state: currentStep > 2 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 2,
//           title: const Text("Gender"),
//           content: Column(
//             children: [
//               const SizedBox(
//                 height: 50.0,
//               ),
//               Text(
//                 "Please Select Your Gender",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               const SizedBox(
//                 height: 100.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       gender = "Male";
//                       print(gender);
//                     },
//                     child: Container(
//                       height: 150.0,
//                       width: 150.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Colors.orange,
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       gender = "Female";
//                       print(gender);
//                     },
//                     child: Container(
//                       height: 150.0,
//                       width: 150.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Colors.green,
//                       ),
//                       // child: Image.asset(name),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 100.0,
//               ),
//             ],
//           )),
//       Step(
//         state: currentStep > 3 ? StepState.complete : StepState.indexed,
//         isActive: currentStep >= 3,
//         title: const Text("Status"),
//         content: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const SizedBox(
//               height: 100.0,
//             ),
//             Text(
//               'Hello, please select your Civil Status',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const SizedBox(
//               height: 150.0,
//             ),
//             TextFormField(
//               controller: statusController,
//               decoration: InputDecoration(
//                 label: const Text('Civil Status'),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 100.0,
//             ),
//           ],
//         ),
//       ),
//     ];
//   }

//   /// In this function we are calling the FirebaseAuth instance
//   /// an CollectionReference of FirebaseFirestore
//   /// and it is creating a collections of users that is based on the user UID or Unique User ID and once it created it will create another collection of user_info to store the user username.
//   addUserInfo() {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     CollectionReference ref = FirebaseFirestore.instance
//         .collection('users')
//         .doc(auth.currentUser?.uid)
//         .collection('user_info');

//     var data = {
//       'username': usernameController,
//     };

//     /// This condition is checking if the form is valid it will save to the FirebaseFirestore  and once it's valid it will send the user to the Assessment Page
//     if (_formKey.currentState!.validate()) {
//       ref.add(data);
//     }
//     StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) => const WelcomePage(),
//             ),
//           );
//         }
//         return UserInfoPage();
//       },
//     );
//   }
// }
