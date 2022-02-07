import 'package:flutter/material.dart';

import 'package:umatter/db/diary_database.dart';
import 'package:umatter/models/my_diary_model/diary.dart';
import 'package:umatter/views/home_page/my_diary/page/edit_diary_page.dart';
import 'package:umatter/views/home_page/my_diary/page/diary_detail_page.dart';
import 'package:umatter/views/home_page/my_diary/widgets/diary_widget.dart';
import 'package:get/get.dart';

class MyDiaryPage extends StatefulWidget {
  const MyDiaryPage({Key? key}) : super(key: key);

  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
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
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 10.0,
                      ),
                      itemCount: notes.length,
                      itemBuilder: (_, index) {
                        final note = notes[index];
                        return GestureDetector(
                          onTap: () async {
                            await Get.to(
                                () => NoteDetailPage(noteId: note.id!));

                            refreshNotes();
                          },
                          child: NoteCardWidget(note: note, index: index),
                        );
                      },
                    ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            tooltip: 'Create Diary',
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () async {
              await Get.to(() => const AddEditNotePage());
              refreshNotes();
            }),
      );
}
