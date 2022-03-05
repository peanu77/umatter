import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/models/diary_page_controller/my_diary_page_controller.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/my_diary/page/view_diary_page.dart';
import 'package:get/get.dart';

class AddDiaryPage extends StatefulWidget {
  final emotion;
  final reason;
  const AddDiaryPage({
    Key? key,
    this.emotion,
    this.reason,
  }) : super(key: key);

  @override
  _AddDiaryPageState createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final databaseManager = DatabaseManager();
  String title = '';
  String desc = '';
  Color bgColor = Colors.white;

  final message = const SnackBar(
    content: Text('Save'),
  );

  selectEmoji() {
    if (widget.emotion.toString() == "Happy") {
      return const InkWell(
        child: Text(
          '😀',
          style: TextStyle(fontSize: 30.0),
        ),
      );
    } else if (widget.emotion.toString() == "Sad") {
      return const Text(
        '😞',
        style: TextStyle(fontSize: 30.0),
      );
    }
  }

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
                // Calling the Database manager'
                databaseManager.addForm(title, desc, _formKey, widget.emotion);
                // Transfer data to the my diary home page
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyDiaryPage(
                              emotion: widget.emotion,
                            )));
                Get.toNamed('/my_diary');
              } else {
                return;
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => MyDiaryPage(emotion: widget.emotion))),
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
              SizedBox(
                height: _size.height / 2,
              ),
              _buildColorPicker(_size),
            ],
          ),
        ),
      ),
      backgroundColor: bgColor,
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
            _buildEmotion(),
            const SizedBox(
              height: 20.0,
            ),
            _buildDescForm(),
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

  _buildEmotion() {
    return Row(
      children: [
        selectEmoji(),
        const Spacer(),
      ],
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
    if (newColor != bgColor) {
      setState(() {
        bgColor = newColor;
      });
    }
  }

  _buildColorPicker(Size size) {
    return SizedBox(
      height: size.height * 0.060,
      child: ListView.builder(
        itemCount: MyDiaryController().myDiaryController.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildBackgroundColorPicker(
                  color: Color(MyDiaryController().myDiaryController[index]),
                ),
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
