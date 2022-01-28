import 'package:equatable/equatable.dart';

class SnippetLanguageModel extends Equatable {
  final String name;
  final String value;

  SnippetLanguageModel({required this.name, required this.value});

  @override
  List<Object?> get props => [name, value];
}
