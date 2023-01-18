part of 'new_snippet_bloc.dart';

abstract class NewSnippetEvent extends Equatable {
  const NewSnippetEvent();
}

class SubmitSnippet extends NewSnippetEvent {
  final SnippetModel snippet;

  SubmitSnippet(this.snippet);

  @override
  List<Object?> get props => [snippet];
}

class LanguagesItemOnSelect extends NewSnippetEvent {
  final SnippetLanguageModel item;

  LanguagesItemOnSelect(this.item);

  @override
  List<Object?> get props => [item];
}

class CodeBodyControllerUpdated extends NewSnippetEvent {
  final String value;

  CodeBodyControllerUpdated(this.value);

  @override
  List<Object?> get props => [value];
}
