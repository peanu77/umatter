import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/assessment_page/assessment_page.dart';
import 'package:umatter/views/user_info_page/user_controller.dart';
import 'package:get/get.dart';

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
              _buildCivilStatusPage(_size),
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
                  child: Image.asset('assets/male.png'),
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
                  child: Image.asset('assets/woman.png'),
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

  _buildCivilStatusPage(_size) {
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AssessmentPage(),
                  ),
                );
              },
              child: const Text('Continue'),
            ),
          ),
        ),
      ],
    );
  }
}
