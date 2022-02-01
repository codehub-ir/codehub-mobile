import 'package:codehub/src/domain/entities/snippet.dart';

class SnippetModel extends Snippet {
  SnippetModel({
    required String id,
    required String title,
    required String description,
    required String lang,
    required String body,
    required String createdOn,
    required String createdBy,
  }) : super(
          id: id,
          body: body,
          description: description,
          lang: lang,
          title: title,
          createdBy: createdBy,
          createdOn: createdOn,
        );

  factory SnippetModel.fromJson(Map data) => SnippetModel(
      id: data["id"],
      title: data["title"],
      description: data["description"],
      lang: data["lang"],
      body: data["body"],
      createdOn: data["created_on"] ?? " ",
      createdBy: data["created_by"] ?? " ");
}
