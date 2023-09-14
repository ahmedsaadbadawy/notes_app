import 'package:hive/hive.dart';

// for the Name of the File this Code will be Generated in.
// Must have the same name ass Model File.
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {

  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });
}
