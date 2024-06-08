import 'package:keep_me/data/database_helper.dart';

class NoteModel {
  ///id of the note that will be given in the databse table
  int? id;
  String title;
  String content;
  String? category;
  NoteModel(
      {this.id,
      required this.title,
      required this.content,
      required this.category});

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.COLUMN_TITLE: title,
      DatabaseHelper.COLUMN_CONTENT: content,
      DatabaseHelper.COLUMN_CATEGORY: category
    };
  }
}
