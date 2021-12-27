import 'package:equatable/equatable.dart';

class SnippetLangModel extends Equatable {
  final String name;
  final String value;

  SnippetLangModel({required this.name, required this.value});

  @override
  List<Object?> get props => [name, value];
}
