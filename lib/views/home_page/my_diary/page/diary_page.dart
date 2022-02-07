import 'package:flutter/material.dart';
import 'package:umatter/db/diary_database.dart';
import 'package:umatter/models/my_diary_model/diary.dart';
import 'package:umatter/views/home_page/my_diary/page/edit_diary_page.dart';
import 'package:umatter/views/home_page/my_diary/widgets/diary_widget.dart';
import 'package:get/get.dart';
import 'diary_detail_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Diary> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    DiaryDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notes = await DiaryDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'My Diary',
            style: TextStyle(fontSize: 24),
          ),
          centerTitle: true,
          actions: const [
            SizedBox(width: 12),
          ],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  // TODO : Change this to an Img
                  ? const Text(
                      'There is no notes at the moment',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (_, index) {
                        final note = notes[index];
                        return GestureDetector(
                          onTap: () async {
                            Get.to(() => NoteDetailPage(noteId: note.id!));

                            refreshNotes();
                          },
                          child: NoteCardWidget(note: note, index: index),
                        );
                      },
                    ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
          ),
          onPressed: () async {
            Get.to(() => const AddEditNotePage());

            refreshNotes();
          },
        ),
      );
}
