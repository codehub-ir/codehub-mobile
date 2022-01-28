class EventsModel {
  EventsModel({
    required this.title,
    required this.body,
    required this.createdOn,
  });

  final String title;
  final String body;
  final DateTime createdOn;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        title: json["title"],
        body: json["body"],
        createdOn: DateTime.parse(json["created_on"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "created_on": createdOn.toIso8601String(),
      };
}
