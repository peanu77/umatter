import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:umatter/db/diary_database.dart';
import 'package:umatter/models/my_diary_model/diary.dart';
import 'package:umatter/views/home_page/my_diary/page/edit_diary_page.dart';
import 'package:get/get.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Diary note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await DiaryDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.chevron_left),
          ),
          actions: [
            deleteButton(),
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        DateFormat.yMMMd().format(note.createdTime),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      note.description,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButton: _buildEditMyDiaryBtn(),
      );

// Edit Button

  Widget _buildEditMyDiaryBtn() => Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          tooltip: "Edit Diary",
          label: Row(
            children: const [
              Icon(
                Icons.edit,
                color: Colors.black,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Edit Diary',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onPressed: () async {
            if (isLoading) return;

            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddEditNotePage(note: note),
            ));

            refreshNote();
          },
        ),
      );
// Delete Button

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await DiaryDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
      );
}
