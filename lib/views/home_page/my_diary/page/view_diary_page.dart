import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:share_plus/share_plus.dart';

class ViewDiaryPage extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;
  final emotion;
  const ViewDiaryPage({
    Key? key,
    required this.data,
    required this.time,
    required this.ref,
    required this.emotion,
  }) : super(key: key);

  @override
  _ViewDiaryPageState createState() => _ViewDiaryPageState();
}

class _ViewDiaryPageState extends State<ViewDiaryPage> {
  bool isEdit = false;
  String? title;
  String? desc;
  String? emotion;
  @override
  Widget build(BuildContext context) {
    title = widget.data['title'];
    desc = widget.data['description'];
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: const Center(
                    child: Text(
                      'Are you sure you want to continue?',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  content: const Text(
                    'By sharing your personal diary to other people we do\'nt have any fault if anything happened.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("No"),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent),
                            onPressed: () {
                              shareDiary(context);
                            },
                            child: const Text("Yes"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isEdit = !isEdit;
              });
            },
            icon: isEdit
                ? IconButton(
                    onPressed: updateForm,
                    icon: const FaIcon(
                      FontAwesomeIcons.save,
                    ))
                : const Icon(
                    Icons.edit,
                  ),
          ),
          IconButton(
            onPressed: deleteForm,
            icon: const Icon(Icons.delete),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
        elevation: 0.0,
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: kfrmTitle,
                      initialValue: widget.data['title'],
                      enabled: isEdit,
                      validator: (value) =>
                          value!.isEmpty ? "Please add a Title" : null,
                      onChanged: (_val) {
                        title = _val;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.time} ",
                          style: kfrmTime,
                        ),
                        Container(
                          child: selectedEmoji(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: TextFormField(
                        maxLines: 20,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: kfrmDesc,
                        initialValue: widget.data['description'],
                        enabled: isEdit,
                        validator: (value) => value != null && value.isEmpty
                            ? "Please add a Description"
                            : null,
                        onChanged: (_val) {
                          desc = _val;
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteForm() async {
    await widget.ref.delete();
    Navigator.pop(context);
  }

  void updateForm() async {
    await widget.ref.update({"title": title, 'description': desc});
    Navigator.of(context).pop();
  }

  void shareDiary(BuildContext context) async {
    String diary = "$title \n\n$desc";
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(diary,
        subject: 'Description',
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  selectedEmoji() {
    if (widget.data['emojis'] == "Happy") {
      return const Text(
        '😀',
        style: TextStyle(fontSize: 30.0),
      );
    } else if (widget.data['emojis'] == "Sad") {
      return const Text(
        '😞',
        style: TextStyle(fontSize: 30.0),
      );
    }
  }
}
