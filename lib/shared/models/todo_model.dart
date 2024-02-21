import 'package:uuid/uuid.dart';

class TodoModel {
  final String id;
  final String title;
  final String? description;
  final DateTime date;

  TodoModel({
    String? cId,
    required this.title,
    this.description,
    DateTime? cDate,
  })  : id = cId ?? const Uuid().v4(),
        date = cDate ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      cId: map['id'],
      title: map['title'],
      description: map['descrption'],
      cDate: DateTime.fromMillisecondsSinceEpoch(
        map['date'],
      ),
    );
  }
}
