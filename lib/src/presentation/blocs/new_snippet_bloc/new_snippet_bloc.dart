import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codehub/screens/new_snippet/model/snippet_lang_model.dart';
import 'package:codehub/screens/new_snippet/model/snippet_model.dart';
import 'package:codehub/services/api_base_helper/api_base_helper.dart';
import 'package:codehub/src/core/constant/api_path/api_path.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/core/utils/custom_debugger/custom_debugger.dart';
import 'package:equatable/equatable.dart';

part 'new_snippet_event.dart';

part 'new_snippet_state.dart';

class NewSnippetBloc extends Bloc<NewSnippetEvent, NewSnippetState> {
  final List<SnippetLanguageModel> languagesModel = [
    SnippetLanguageModel(name: "-----", value: "-"),
    SnippetLanguageModel(name: "Arduino", value: "arduino"),
    SnippetLanguageModel(name: "Bash", value: "bash"),
    SnippetLanguageModel(name: "C", value: "c"),
    SnippetLanguageModel(name: "C++", value: "cpp"),
    SnippetLanguageModel(name: "C#", value: "csharp"),
    SnippetLanguageModel(name: "Css", value: "css"),
    SnippetLanguageModel(name: "Dart", value: "dart"),
    SnippetLanguageModel(name: "Docker", value: "docker"),
    SnippetLanguageModel(name: "Docker-Compose", value: "docker-compose"),
    SnippetLanguageModel(name: "Go", value: "go"),
    SnippetLanguageModel(name: "Html", value: "html"),
    SnippetLanguageModel(name: "Java", value: "java"),
    SnippetLanguageModel(name: "Js", value: "js"),
    SnippetLanguageModel(name: "Json", value: "json"),
    SnippetLanguageModel(name: "Lua", value: "lua"),
    SnippetLanguageModel(name: "Markdown", value: "md"),
    SnippetLanguageModel(name: "MySql", value: "mysql"),
    SnippetLanguageModel(name: "Php", value: "php"),
    SnippetLanguageModel(name: "Python", value: "python"),
    SnippetLanguageModel(name: "Ruby", value: "rb"),
  ];

  NewSnippetBloc() : super(NewSnippetInitial()) {
    on<NewSnippetEvent>((event, emit) {});
    on<LanguagesItemOnSelect>((event, emit) {
      emit(LanguageSelectedSuccess(event.item));
    });
    on<SubmitSnippet>((event, emit) async {
      try {
        emit(SubmitSnippetLoading());

        if (checkValues(event.snippet) != null) {
          String? error = checkValues(event.snippet);
          emit(SubmitSnippetFailed(error!));
        } else {
          var data = await ApiBaseHelper.post(createSnippetPath, body: {
            "title": event.snippet.title,
            "description": event.snippet.description,
            "body": event.snippet.body,
            "lang": event.snippet.language,
          });

          print(data);

          emit(SubmitSnippetSuccess());
        }
      } catch (e, s) {
        emit(SubmitSnippetFailed(e.toString()));
        CustomDebugger.errorDebugger(e, s);
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
