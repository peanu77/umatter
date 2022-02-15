import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umatter/db/auth/google_signin_auth_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class AddDiaryPage extends StatefulWidget {
  const AddDiaryPage({
    Key? key,
  }) : super(key: key);

  @override
  _AddDiaryPageState createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  String title = '';
  String desc = '';
  Color _bgColor = Colors.white;

  setBackgroundColor(Color newColor) {
    if (newColor != _bgColor) {
      setState(() {
        _bgColor = newColor;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                addForm();
              } else {
                return;
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildForm(_size),
              // _buildColorPicker(_size),
              const SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
      backgroundColor: _bgColor,
    );
  }

  /// This Widget is responsible for the form (Title, description)
  _buildForm(Size size) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: size.height * 0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
                style: kfrmTitle,
                validator: (value) =>
                    value != null && value.isEmpty ? "Can't be Empty!" : null,
                onChanged: (_val) {
                  title = _val;
                },
              ),
              TextFormField(
                maxLines: 15,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Say something here...",
                ),
                validator: (value) => value != null && value.isEmpty
                    ? "Please add a description"
                    : null,
                style: kfrmDesc,
                onChanged: (_val) {
                  desc = _val;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // _buildColorPicker(Size size) {
  //   return Container(
  //     color: Colors.orange,
  //     height: size.height * 0.060,
  //     child: ListView.builder(
  //       itemCount: MyDiaryController().myDiaryController.length,
  //       itemBuilder: (context, index) {
  //         return Row(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //               child: _buildBackgroundColorPicker(
  //                   color: MyDiaryController().myDiaryController[index]),
  //             ),
  //           ],
  //         );
  //       },
  //       scrollDirection: Axis.horizontal,
  //     ),
  //   );
  // }

  /// This widget is responsible for the size and styling of the color picker
  // Widget _buildBackgroundColorPicker({required Color color}) {
  //   return GestureDetector(
  //     onTap: () {
  //       setBackgroundColor(color);
  //     },
  //     child: Container(
  //       width: 50,
  //       decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: color,
  //         border: Border.all(color: Colors.white, width: 4),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.4),
  //             blurRadius: 5,
  //             offset: const Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  /// This function is for saving the user input into the firebase firestore database
  /// by the use of Collection reference we we are getting the instance of firebase firestore /// and use the collection to create a user and assign it with a document type UID
  addForm() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .collection('notes');

    var data = {
      'title': title,
      'description': desc,
      'created': DateTime.now(),
      // 'emojis': {}
      'selectedColor': setBackgroundColor(_bgColor),
    };

    if (_formKey.currentState!.validate()) {
      ref.add(data);
    }
    Navigator.pop(context);
  }
}
