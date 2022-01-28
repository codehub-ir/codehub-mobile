class SnippetModel {
  final String title, description, language, body;

  SnippetModel({
    required this.title,
    required this.description,
    required this.language,
    required this.body,
  });

  static toJson(SnippetModel item) => {
        "title": item.title,
        "description": item.description,
        "body": item.body,
        "lang": item.language
      };
}
