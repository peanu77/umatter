import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/models/diary_page_controller/my_diary_page_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class AddDiaryPage extends StatefulWidget {
  const AddDiaryPage({
    Key? key,
  }) : super(key: key);

  @override
  _AddDiaryPageState createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final databaseManager = DatabaseManager();
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

  final message = const SnackBar(
    content: Text('Save'),
  );
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(message);
                databaseManager.addForm(title, desc, _formKey);
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            _buildTitleForm(),
            _buildDescForm(),
            // _buildColorPicker(size),
          ],
        ),
      ),
    );
  }

  _buildTitleForm() {
    return TextFormField(
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
    );
  }

  _buildDescForm() {
    return TextFormField(
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration.collapsed(
        border: InputBorder.none,
        hintText: "Write something here...",
      ),
      validator: (value) => value != null && value.isEmpty
          ? "Description must not be Empty!"
          : null,
      style: kfrmDesc,
      onChanged: (_val) {
        desc = _val;
      },
    );
  }

  _buildColorPicker(Size size) {
    return Container(
      color: Colors.orange,
      height: size.height * 0.060,
      child: ListView.builder(
        itemCount: MyDiaryController().myDiaryController.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildBackgroundColorPicker(
                    color: MyDiaryController().myDiaryController[index]),
              ),
            ],
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  // / This widget is responsible for the size and styling of the color picker
  Widget _buildBackgroundColorPicker({required Color color}) {
    return GestureDetector(
      onTap: () {
        setBackgroundColor(color);
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: Colors.white, width: 4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
