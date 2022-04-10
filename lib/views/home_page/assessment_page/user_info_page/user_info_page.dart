import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/assessment_page/user_info_page/user_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/preferences/run_preferences.dart';
import 'package:umatter/preferences/consts.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

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
  String? genderValue;
  String? civilStatusValue;

  final civilStatusItem = ['Single', 'Married', 'Separated', 'Widowed'];
  final genderItem = ["Male", "Female", "Others"];

  SharePrefConfig sharePrefConfig = SharePrefConfig();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 50.0),
                  child: Column(
                    children: [
                      TextFormField(
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
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text('Age'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (value) => age = value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your age";
                          }
                          if (value.length > 10) {
                            return "Username too long!";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Gender"),
                            DropdownButton(
                                iconSize: 36,
                                value: genderValue,
                                // isExpanded: true,
                                items: genderItem.map(buildGenderList).toList(),
                                onChanged: (genderValue) {
                                  setState(() => this.genderValue =
                                      genderValue as String?);
                                  // print(genderValue);
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Civil Status"),
                            DropdownButton(
                              elevation: 0,
                              iconSize: 36,
                              value: civilStatusValue,
                              // isExpanded: true,
                              items:
                                  civilStatusItem.map(buildCivilList).toList(),
                              onChanged: (civilStatusValue) {
                                setState(() => this.civilStatusValue =
                                    civilStatusValue as String?);
                                // print(civilStatusValue);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      SizedBox(
                        height: _size.height * 0.07,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: kPrimaryFrmColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          onPressed: () {
                            // print(username);
                            // print(age);
                            // print(genderValue);
                            // print(civilStatusValue);
                            databaseManager.createUserInfo(
                                username, age, genderValue, civilStatusValue);
                            sharePrefConfig.userInfoController();
                            _runPreferences.disableFirstRun(assessmentRunKey);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const NavBarPage()),
                                (route) => false);
                          },
                          child: const Text('Continue'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildGenderList(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  DropdownMenuItem<String> buildCivilList(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
