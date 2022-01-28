import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String title;
  final String body;
  final DateTime createdOn;

  Event({required this.title, required this.body, required this.createdOn});

  @override
  List<Object?> get props => [title, body, createdOn];

  @override
  bool? get stringify => true;
}
