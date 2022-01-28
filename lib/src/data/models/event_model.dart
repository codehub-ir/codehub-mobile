import 'package:codehub/src/domain/entities/event.dart';

class EventsModel extends Event {
  EventsModel({
    required String title,
    required String body,
    required DateTime createdOn,
  }) : super(body: body, title: title, createdOn: createdOn);

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        title: json["title"],
        body: json["body"],
        createdOn: DateTime.parse(json["created_on"]),
      );
}
