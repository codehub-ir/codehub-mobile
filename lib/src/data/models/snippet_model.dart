import 'package:codehub/src/domain/entities/snippet.dart';

class SnippetModel extends Snippet {
  SnippetModel({
    required String title,
    required String description,
    required String language,
    required String body,
  }) : super(
            body: body,
            description: description,
            language: language,
            title: title);

  static toJson(SnippetModel item) => {
        "title": item.title,
        "description": item.description,
        "body": item.body,
        "lang": item.language
      };
}
