const String tableNotes = 'notes';

class DiaryFields {
  static final List<String> values = [
    /// Add all fields
    id, number, title, description, time
  ];

  static const String id = '_id';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String time = 'time';
}

class Diary {
  final int? id;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Diary({
    this.id,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Diary copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Diary(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Diary fromJson(Map<String, Object?> json) => Diary(
        id: json[DiaryFields.id] as int?,
        number: json[DiaryFields.number] as int,
        title: json[DiaryFields.title] as String,
        description: json[DiaryFields.description] as String,
        createdTime: DateTime.parse(json[DiaryFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        DiaryFields.id: id,
        DiaryFields.title: title,
        DiaryFields.number: number,
        DiaryFields.description: description,
        DiaryFields.time: createdTime.toIso8601String(),
      };
}
