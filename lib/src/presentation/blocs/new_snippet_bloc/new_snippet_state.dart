part of 'new_snippet_bloc.dart';

abstract class NewSnippetState extends Equatable {
  const NewSnippetState();
}

class NewSnippetInitial extends NewSnippetState {
  @override
  List<Object> get props => [];
}

class SubmitSnippetLoading extends NewSnippetState {
  @override
  List<Object?> get props => [];
}

class SubmitSnippetSuccess extends NewSnippetState {
  @override
  List<Object?> get props => [];
}

class SubmitSnippetFailed extends NewSnippetState {
  final String error;

  SubmitSnippetFailed(this.error);

  @override
  List<Object?> get props => [error];
}

class LanguageSelectedSuccess extends NewSnippetState {
  final SnippetLanguageModel item;

  LanguageSelectedSuccess(this.item);

  @override
  List<Object?> get props => [item];
}

class UpdateCodeBodyValue extends NewSnippetState {
  final String value;

  UpdateCodeBodyValue(this.value);

  @override
  List<Object?> get props => [value];
}
