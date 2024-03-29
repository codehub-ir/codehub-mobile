import 'package:bloc/bloc.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/core/utils/custom_debugger/custom_debugger.dart';
import 'package:codehub/src/data/models/snippet_language_model.dart';
import 'package:codehub/src/data/models/snippet_model.dart';
import 'package:codehub/src/domain/usecases/create_snippet_usecase.dart';
import 'package:equatable/equatable.dart';

part 'new_snippet_event.dart';
part 'new_snippet_state.dart';

class NewSnippetBloc extends Bloc<NewSnippetEvent, NewSnippetState> {
  final CreateSnippetUseCase _createSnippetUseCase;

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

  NewSnippetBloc(this._createSnippetUseCase) : super(NewSnippetInitial()) {
    on<NewSnippetEvent>((event, emit) {});
    on<LanguagesItemOnSelect>((event, emit) {
      emit(LanguageSelectedSuccess(event.item));
    });
    on<SubmitSnippet>(_onSubmitSnippet);
    on<CodeBodyControllerUpdated>(
      (event, emit) {
        emit(UpdateCodeBodyValue(event.value));
      },
    );
  }

  _onSubmitSnippet(SubmitSnippet event, Emitter emit) async {
    try {
      emit(SubmitSnippetLoading());

      if (checkValues(event.snippet) != null) {
        String? error = checkValues(event.snippet);
        emit(SubmitSnippetFailed(error!));
      } else {
        DataState data = await _createSnippetUseCase.call(params: {
          "title": event.snippet.title,
          "description": event.snippet.description,
          "body": event.snippet.body,
          "lang": event.snippet.lang,
        });

        print(data);

        if (data.error == null && data.data != null) {
          emit(SubmitSnippetSuccess());
        } else {
          emit(SubmitSnippetFailed(data.error!.message));
        }
      }
    } catch (e, s) {
      emit(SubmitSnippetFailed(e.toString()));
      CustomDebugger.errorDebugger(e, s);
    }
  }

  String? checkValues(SnippetModel item) {
    if (item.title.isEmpty) {
      return titleSnippetError;
    } else if (item.description.isEmpty) {
      return descriptionSnippetError;
    } else if (item.lang.isEmpty || item.lang == "-") {
      return languageSnippetError;
    } else if (item.body.isEmpty) {
      return bodySnippetError;
    } else {
      return null;
    }
  }
}
