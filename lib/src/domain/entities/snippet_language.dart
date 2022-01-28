import 'package:equatable/equatable.dart';

class SnippetLanguage extends Equatable {
  final String name;
  final String value;

  SnippetLanguage({required this.name, required this.value});

  @override
  List<Object?> get props => [name, value];

  @override
  bool? get stringify => true;
}
