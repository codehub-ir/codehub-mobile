import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codehub/constant/app_strings/app_strings.dart';
import 'package:codehub/screens/new_snippet/model/snippet_lang_model.dart';
import 'package:codehub/screens/new_snippet/model/snippet_model.dart';
import 'package:equatable/equatable.dart';

part 'new_snippet_event.dart';

part 'new_snippet_state.dart';

class NewSnippetBloc extends Bloc<NewSnippetEvent, NewSnippetState> {
  final List<SnippetLangModel> languagesModel = [
    SnippetLangModel(name: "-----", value: "-"),
    SnippetLangModel(name: "Arduino", value: "arduino"),
    SnippetLangModel(name: "Bash", value: "bash"),
    SnippetLangModel(name: "C", value: "c"),
    SnippetLangModel(name: "C++", value: "cpp"),
    SnippetLangModel(name: "C#", value: "csharp"),
    SnippetLangModel(name: "Css", value: "css"),
    SnippetLangModel(name: "Dart", value: "dart"),
    SnippetLangModel(name: "Docker", value: "docker"),
    SnippetLangModel(name: "Go", value: "go"),
    SnippetLangModel(name: "Html", value: "html"),
    SnippetLangModel(name: "Java", value: "java"),
    SnippetLangModel(name: "Js", value: "js"),
    SnippetLangModel(name: "Json", value: "json"),
    SnippetLangModel(name: "Lua", value: "lua"),
    SnippetLangModel(name: "Markdown", value: "md"),
    SnippetLangModel(name: "MySql", value: "mysql"),
    SnippetLangModel(name: "Php", value: "php"),
    SnippetLangModel(name: "Python", value: "python"),
    SnippetLangModel(name: "Ruby", value: "rb"),
  ];

  NewSnippetBloc() : super(NewSnippetInitial()) {
    on<NewSnippetEvent>((event, emit) {});
    on<LanguagesItemOnSelect>((event, emit) {
      emit(LanguageSelectedSuccess(event.item));
    });
    on<SubmitSnippet>((event, emit) {
      emit(SubmitSnippetLoading());

      if (checkValues(event.snippet) != null) {
        String? error = checkValues(event.snippet);
        emit(SubmitSnippetFailed(error!));
      } else {
        emit(SubmitSnippetSuccess());
      }
    });
  }

  String? checkValues(SnippetModel item) {
    if (item.title.isEmpty) {
      return titleSnippetError;
    } else if (item.description.isEmpty) {
      return descriptionSnippetError;
    } else if (item.language.isEmpty || item.language == "-") {
      return languageSnippetError;
    } else if (item.body.isEmpty) {
      return bodySnippetError;
    } else {
      return null;
    }
  }
}
