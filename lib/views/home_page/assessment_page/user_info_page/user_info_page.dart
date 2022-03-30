// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:umatter/auth/database_manager.dart';
// import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
// import 'package:umatter/models/contants/constants.dart';
// import 'package:get/get.dart';
// import 'package:umatter/views/home_page/assessment_page/user_info_page/user_controller.dart';
// import 'package:umatter/views/welcome_page/welcome_page.dart';
// import 'package:umatter/preferences/run_preferences.dart';
// import 'package:umatter/preferences/consts.dart';

// class UserInfoPage extends StatefulWidget {
//   const UserInfoPage({Key? key}) : super(key: key);

//   @override
//   State<UserInfoPage> createState() => _UserInfoPageState();
// }

// class _UserInfoPageState extends State<UserInfoPage> {
//   PageController pageController = PageController();
//   DatabaseManager databaseManager = DatabaseManager();

//   final _formKey = GlobalKey<FormState>();
//   final controller = UserInfoController();
//   final _runPreferences = RunPreferences();

//   String username = '';
//   String age = '';
//   String gender = '';
//   String civilStatus = "Single";
//   int index = 0;
//   bool notSelected = false;
//   bool isSelected = false;
//   Color color = Colors.white;

//   final items = ['Single', 'Married', 'Separated', 'Widowed'];
//   SharePrefConfig sharePrefConfig = SharePrefConfig();
//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Form(
//           key: _formKey,
//           child: PageView(
//             physics: const NeverScrollableScrollPhysics(),
//             controller: pageController,
//             children: [
//               _buildUsernamePage(_size),
//               _buildAgePage(_size),
//               _buildGenderPage(_size),
//               _buildCivilStatusPage(_size, _runPreferences),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _buildUsernamePage(_size) {
//     return Column(
//       children: [
//         const Spacer(),
//         Text(
//           controller.userController[0].header,
//           textAlign: TextAlign.center,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         // Form
//         const Spacer(
//           flex: 2,
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: TextFormField(
//             decoration: InputDecoration(
//               label: const Text('UserName'),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//             ),
//             onChanged: (value) => username = value,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return "Enter a Username";
//               }
//               if (value.length > 10) {
//                 return "Username too long!";
//               } else {
//                 return null;
//               }
//             },
//           ),
//         ),
//         const Spacer(
//           flex: 3,
//         ),
//         // Button
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SizedBox(
//             width: double.infinity,
//             height: _size.height * 0.06,
//             child: ElevatedButton(
//               style: kElevatedbtnprimary,
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   pageController.nextPage(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.ease);
//                   print(username);
//                 }
//                 await SharePrefConfig.setUsername(username);
//               },
//               child: const Text('Continue'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   _buildAgePage(_size) {
//     return Column(
//       children: [
//         const Spacer(),
//         Text(
//           controller.userController[1].header,
//           textAlign: TextAlign.center,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         // Form
//         const Spacer(
//           flex: 2,
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: TextFormField(
//             decoration: InputDecoration(
//               label: const Text('Age'),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//             ),
//             keyboardType: TextInputType.number,
//             onChanged: (value) => age = value,
//             validator: (value) {
//               if (value!.isEmpty) {
//                 return "Enter a valid username";
//               }
//               if (!value.isNum) {
//                 return "Invalid Input";
//               } else {
//                 return null;
//               }
//             },
//           ),
//         ),
//         const Spacer(
//           flex: 3,
//         ),
//         // Button
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SizedBox(
//             width: double.infinity,
//             height: _size.height * 0.06,
//             child: ElevatedButton(
//               style: kElevatedbtnprimary,
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   pageController.nextPage(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.ease);
//                   print(username);

//                   print('Form Valid');
//                 }
//               },
//               child: const Text('Continue'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   _buildGenderPage(_size) {
//     return Column(
//       children: [
//         const Spacer(),
//         Text(
//           controller.userController[2].header,
//           textAlign: TextAlign.center,
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         const Spacer(
//           flex: 2,
//         ),
//         // Form
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   isSelected = true;
//                   color = Colors.orange;
//                 });

//                 gender = "Male";
//                 print("Male");
//               },
//               child: Container(
//                 height: 150.0,
//                 width: 150.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   color: color,
//                 ),
//                 child: FittedBox(
//                   fit: BoxFit.fill,
//                   child: Image.asset('assets/img/gender/male.png'),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 print("Female");
//                 gender = "Female";
//               },
//               child: Container(
//                 height: 150.0,
//                 width: 150.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   // color: Colors.green,
//                 ),
//                 child: FittedBox(
//                   fit: BoxFit.fill,
//                   child: Image.asset('assets/img/gender/woman.png'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const Spacer(
//           flex: 3,
//         ),
//         // Button
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SizedBox(
//             width: double.infinity,
//             height: _size.height * 0.06,
//             child: ElevatedButton(
//               style: kElevatedbtnprimary,
//               onPressed: () {
//                 pageController.nextPage(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.ease);
//               },
//               child: const Text('Continue'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:umatter/views/home_page/assessment_page/user_info_page/user_controller.dart';

// import '../../../../auth/database_manager.dart';
// import '../../../../controllers/shared_pref_controller/shared_pref_controller.dart';
// import '../../../../preferences/run_preferences.dart';

// class UserInfoPage extends StatefulWidget {
//   const UserInfoPage({Key? key}) : super(key: key);

//   @override
//   State<UserInfoPage> createState() => _UserInfoPageState();
// }

// class _UserInfoPageState extends State<UserInfoPage> {
//   final pageController = PageController();
//   bool isLastPage = false;
//   DatabaseManager databaseManager = DatabaseManager();

//   final _formKey = GlobalKey<FormState>();
//   final _userInfo = UserInfoController();
//   final _runPreferences = RunPreferences();

//   String username = '';
//   String age = '';
//   String gender = '';
//   String civilStatus = "Single";
//   int index = 0;
//   bool notSelected = false;
//   bool isSelected = false;
//   Color color = Colors.white;

//   final items = ['Single', 'Married', 'Separated', 'Widowed'];
//   SharePrefConfig sharePrefConfig = SharePrefConfig();

//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;

//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           padding: const EdgeInsets.only(bottom: 100.0),
//           child: PageView(
//             controller: pageController,
//             key: _formKey,
//             onPageChanged: (index) {
//               setState(() {
//                 isLastPage = index == 4;
//               });
//             },
//             children: [
//               // Username
//               Column(
//                 children: [
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.all(25.0),
//                     child: Text(
//                       _userInfo.userController[0].header,
//                       style: Theme.of(context).textTheme.headline4,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 30.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         label: const Text('UserName'),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       onChanged: (value) => username = value,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter a Username";
//                         }
//                         if (value.length > 10) {
//                           return "Username too long!";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                 ],
//               ),
//               // Age
//               Column(
//                 children: [
//                   const Spacer(),
//                   Text(
//                     _userInfo.userController[1].header,
//                     style: Theme.of(context).textTheme.headline4,
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 30.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         label: const Text('Age'),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                       onChanged: (value) => age = value,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter a valid username";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                 ],
//               ),
//               // Gender
//               Column(
//                 children: [
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       _userInfo.userController[2].header,
//                       style: Theme.of(context).textTheme.headline4,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           setState(() {
//                             isSelected = true;
//                             color = Colors.orange;
//                           });

//                           gender = "Male";
//                           print("Male");
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             color: Colors.orange,
//                           ),
//                           child: Lottie.asset('assets/img/gender/man.json',
//                               height: 150.0, fit: BoxFit.fill, width: 150),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           print("Female");
//                           gender = "Female";
//                         },
//                         child: Container(
//                           height: 150.0,
//                           width: 150.0,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15.0),
//                             // color: Colors.green,
//                           ),
//                           child: FittedBox(
//                             fit: BoxFit.fill,
//                             child: Lottie.asset('assets/img/gender/woman.json'),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(
//                     flex: 3,
//                   ),
//                 ],
//               ),
//               // Civil Status
//               Column(
//                 children: [
//                   const Spacer(),
//                   // heading
//                   Container(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text(
//                       _userInfo.userController[3].header,
//                       style: Theme.of(context).textTheme.headline4,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                   // Body
//                   Center(
//                     child: SizedBox(
//                       height: 300,
//                       child: CupertinoPicker(
//                         itemExtent: 64,
//                         looping: true,
//                         children: items.map(
//                           (item) {
//                             return Center(
//                               child: Text(item),
//                             );
//                           },
//                         ).toList(),
//                         onSelectedItemChanged: (index) {
//                           setState(() {
//                             this.index = index;
//                           });
//                           final item = items[index];
//                           civilStatus = item;
//                           print('Selected Item is $item');
//                         },
//                       ),
//                     ),
//                   ),
//                   const Spacer(
//                     flex: 2,
//                   ),
//                 ],
//               ),
//               // Summary
//               Column(
//                 children: [
//                   // Username
//                   Text('Looks'),
//                   // Age
//                   Text('Looks'),
//                   // Gender
//                   Text('Looks'),
//                   // Civil Status
//                   Text('Looks'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         bottomSheet: SizedBox(
//           height: _size.height * 0.12,
//           child: Column(
//             children: [
//               const Spacer(),
//               // Button
//               isLastPage
//                   ? Container(
//                       padding: const EdgeInsets.all(15.0),
//                       alignment: Alignment.center,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 print('Last Page');
//                                 print(await SharePrefConfig.setUsername(
//                                     username));
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 20.0,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                               ),
//                               child: const Text('Back'),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 15.0,
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: ElevatedButton(
//                               onPressed: () async {},
//                               style: ElevatedButton.styleFrom(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 20.0),
//                                 primary: Colors.orangeAccent,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                               ),
//                               child: const Text('Looks Good!'),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () async {
//                             // pageController.nextPage(
//                             //     duration: const Duration(milliseconds: 300),
//                             //     curve: Curves.ease);
//                             // print(username);
//                             // print(age);
//                             // print(gender);
//                             if (pageController == 0) {
//                               print('Page1');
//                               pageController.nextPage(
//                                   duration: Duration(milliseconds: 300),
//                                   curve: Curves.easeIn);
//                             }
//                           },
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.all(20.0),
//                             shape: const CircleBorder(),
//                             primary: Colors.orangeAccent,
//                           ),
//                           child: const Icon(
//                             Icons.chevron_right,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//               const Spacer(flex: 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import '../../../../controllers/shared_pref_controller/shared_pref_controller.dart';

// class UserInfoPage extends StatefulWidget {
//   const UserInfoPage({Key? key}) : super(key: key);

//   @override
//   State<UserInfoPage> createState() => _UserInfoPageState();
// }

// class _UserInfoPageState extends State<UserInfoPage> {
//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//       body: Container(
//         padding: const EdgeInsets.only(bottom: 100.0),
//         child: PageView.builder(
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Text('asd'),
//               ],
//             );
//           },
//         ),
//       ),
//       bottomSheet: SizedBox(
//           height: _size.height * 0.12,
//           child: Column(children: [
//             const Spacer(),
//             // Button
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     // pageController.nextPage(
//                     //     duration: const Duration(milliseconds: 300),
//                     //     curve: Curves.ease);
//                     // print(username);
//                     // print(age);
//                     // print(gender);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(20.0),
//                     shape: const CircleBorder(),
//                     primary: Colors.orangeAccent,
//                   ),
//                   child: const Icon(
//                     Icons.chevron_right,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ])),
//     ));
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/assessment_page/user_info_page/user_controller.dart';
import 'package:get/get.dart';
import 'package:umatter/views/welcome_page/welcome_page.dart';
import 'package:umatter/preferences/run_preferences.dart';
import 'package:umatter/preferences/consts.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  PageController pageController = PageController();
  DatabaseManager databaseManager = DatabaseManager();

  final _formKey = GlobalKey<FormState>();
  final controller = UserInfoController();
  final _runPreferences = RunPreferences();

  String username = '';
  String age = '';
  String gender = '';
  String civilStatus = "Single";
  int index = 0;
  bool notSelected = false;
  bool isSelected = false;
  Color color = Colors.white;

  final items = ['Single', 'Married', 'Separated', 'Widowed'];
  SharePrefConfig sharePrefConfig = SharePrefConfig();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              _buildUsernamePage(_size),
              _buildAgePage(_size),
              _buildGenderPage(_size),
              _buildCivilStatusPage(_size, _runPreferences),
            ],
          ),
        ),
      ),
    );
  }

  _buildUsernamePage(_size) {
    return Column(
      children: [
        const Spacer(),
        Text(
          controller.userController[0].header,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        // Form
        const Spacer(
          flex: 2,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text('UserName'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            onChanged: (value) => username = value,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter a Username";
              }
              if (value.length > 10) {
                return "Username too long!";
              } else {
                return null;
              }
            },
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        // Button
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            height: _size.height * 0.06,
            child: ElevatedButton(
              style: kElevatedbtnprimary,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  print(username);
                }
                await SharePrefConfig.setUsername(username);
              },
              child: const Text('Continue'),
            ),
          ),
        ),
      ],
    );
  }

  _buildAgePage(_size) {
    return Column(
      children: [
        const Spacer(),
        Text(
          controller.userController[1].header,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        // Form
        const Spacer(
          flex: 2,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              label: const Text('Age'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) => age = value,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter a valid username";
              }
              if (!value.isNum) {
                return "Invalid Input";
              } else {
                return null;
              }
            },
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        // Button
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            height: _size.height * 0.06,
            child: ElevatedButton(
              style: kElevatedbtnprimary,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                  print(username);

                  print('Form Valid');
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ),
      ],
    );
  }

  _buildGenderPage(_size) {
    return Column(
      children: [
        const Spacer(),
        Text(
          controller.userController[2].header,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        const Spacer(
          flex: 2,
        ),
        // Form
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isSelected = true;
                  color = Colors.orange;
                });

                gender = "Male";
                print("Male");
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: color,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('assets/img/gender/male.png'),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Female");
                gender = "Female";
              },
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  // color: Colors.green,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('assets/img/gender/woman.png'),
                ),
              ),
            ),
          ],
        ),
        const Spacer(
          flex: 3,
        ),
        // Button
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            height: _size.height * 0.06,
            child: ElevatedButton(
              style: kElevatedbtnprimary,
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              },
              child: const Text('Continue'),
            ),
          ),
        ),
      ],
    );
  }

  _buildCivilStatusPage(_size, RunPreferences runPreferences) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Text(
          controller.userController[3].header,
          // controller.userController[index].header,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 25.0),
        ),
        const Spacer(
          flex: 2,
        ),
        Center(
          child: SizedBox(
            height: 300,
            child: CupertinoPicker(
              itemExtent: 64,
              looping: true,
              children: items.map(
                (item) {
                  return Center(
                    child: Text(item),
                  );
                },
              ).toList(),
              onSelectedItemChanged: (index) {
                setState(() {
                  this.index = index;
                });
                final item = items[index];
                civilStatus = item;
                print('Selected Item is $item');
              },
            ),
          ),
        ),

        const Spacer(
          flex: 3,
        ),
        // Button
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            height: _size.height * 0.06,
            child: ElevatedButton(
              style: kElevatedbtnprimary,
              onPressed: () async {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);

                databaseManager.createUserInfo(
                    username, age, gender, civilStatus);
                sharePrefConfig.userInfoController();
                runPreferences.disableFirstRun(assessmentRunKey);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const WelcomePage(),
                //   ),
                // );
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const WelcomePage()),
                    (route) => false);
              },
              child: const Text('Continue'),
            ),
          ),
        ),
      ],
    );
  }
}

// TODO: FIX THIS SHIT, USE A MORE PRACTICAL WAY OF GETTING USER INFORMATION

// import 'package:flutter/material.dart';

// class UserInfoPage extends StatefulWidget {
//   const UserInfoPage({Key? key}) : super(key: key);

//   @override
//   State<UserInfoPage> createState() => _UserInfoPageState();
// }

// class _UserInfoPageState extends State<UserInfoPage> {
//   int currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Stepper(
//         steps: _buildSteps(),
//         currentStep: currentStep,
//         onStepContinue: () {
//           final isLastStep = currentStep == _buildSteps().length - 1;
//           if (isLastStep) {
//           } else {
//             setState(() => currentStep += 1);
//           }
//         },
//         onStepCancel: () {
//           currentStep == 0 ? null : setState(() => currentStep -= 1);
//         },
//       )),
//     );
//   }

//   List<Step> _buildSteps() => [
//         Step(
//           isActive: currentStep >= 0,
//           title: Text(''),
//           content: Container(),
//         ),
//         Step(
//           isActive: currentStep >= 1,
//           title: Text(''),
//           content: Container(),
//         ),
//         Step(
//           isActive: currentStep >= 2,
//           title: Text(''),
//           content: Container(),
//         ),
//         Step(
//           isActive: currentStep >= 3,
//           title: Text(''),
//           content: Container(),
//         ),
//       ];
// }
