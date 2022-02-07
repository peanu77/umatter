import 'package:flutter/material.dart';
import 'package:umatter/db/diary_database.dart';

import 'package:umatter/models/my_diary_model/diary.dart';
import 'package:umatter/views/home_page/my_diary/widgets/diary_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Diary? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            number: number,
            title: title,
            description: description,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
        floatingActionButton: buildButton(),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          tooltip: 'Save Diary',
          onPressed: () => addOrUpdateNote(),
          label: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      number: number,
      title: title,
      description: description,
    );

    await DiaryDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Diary(
      title: title,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    await DiaryDatabase.instance.create(note);
  }
}
