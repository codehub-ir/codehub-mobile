import 'package:equatable/equatable.dart';

class Snippet extends Equatable {
  final String title, description, language, body;

  Snippet({
    required this.title,
    required this.description,
    required this.language,
    required this.body,
  });

  @override
  List<Object?> get props => [title, description, language, body];

  @override
  bool? get stringify => true;
}
