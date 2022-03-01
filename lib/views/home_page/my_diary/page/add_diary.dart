import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/models/diary_page_controller/my_diary_page_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class AddDiaryPage extends StatefulWidget {
  final String emotion;
  final String reason;
  const AddDiaryPage({
    Key? key,
    required this.emotion,
    required this.reason,
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

  final message = const SnackBar(
    content: Text('Save'),
  );
  selectEmoji() {
    if (widget.emotion == "Happy") {
      Lottie.asset('assets/icons/json/happy.json');
    } else if (widget.emotion == "Sad") {
      Lottie.asset('assets/icons/json/sad.json');
    }
  }

  parseReasonList() {
    for (var i = 0; i < widget.reason.length; i++) {
      print(widget.reason[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    String emotions = widget.emotion;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(message);
                // Calling the Database manager'
                databaseManager.addForm(title, desc, _formKey, emotions);
                Get.toNamed('/my_diary');
              } else {
                return;
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
        leading: IconButton(
          onPressed: () => Get.toNamed("/my_diary"),
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
            const SizedBox(
              height: 15.0,
            ),
            _buildTitleForm(),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Chip(
                  label: Text(widget.emotion),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            _buildDescForm(),
            // _buildColorPicker(size),
          ],
        ),
      ),
    );
  }

  _buildTitleForm() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Title",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
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
        hintText: "Hello how are you feeling today?",
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

  setBackgroundColor(Color newColor) {
    if (newColor != _bgColor) {
      setState(() {
        _bgColor = newColor;
      });
    }
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
