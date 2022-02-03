import 'package:equatable/equatable.dart';

class Snippet extends Equatable {
  final String id, title, description, lang, body, createdBy, createdOn;

  Snippet({
    required this.id,
    required this.title,
    required this.description,
    required this.lang,
    required this.body,
    required this.createdBy,
    required this.createdOn,
  });

  @override
  List<Object?> get props => [
        id,
        createdBy,
        createdOn,
        title,
        description,
        lang,
        body,
      ];

  @override
  bool? get stringify => true;
}
