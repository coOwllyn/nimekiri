import 'package:equatable/equatable.dart';

class Task extends Equatable {
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? 0;
    isDeleted = isDeleted ?? 0;
    isFavorite = isFavorite ?? 0;
  }

  final String id;
  final String title;
  final String description;
  final String date;
  int? isDone;
  int? isDeleted;
  int? isFavorite;

  @override
  List<Object?> get props => [
        id,
        title,
        date,
        description,
        isDeleted,
        isDone,
        isFavorite,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavorite': isFavorite,
    };
  }

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? date,
    int? isDone,
    int? isDeleted,
    int? isFavorite,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as int : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as int : null,
    );
  }
}
