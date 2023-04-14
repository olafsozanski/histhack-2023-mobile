class Event {
  Event({
    required this.date,
    required this.name,
    required this.description,
  });

  DateTime date;
  String name;
  String description;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        description: json["description"],
      );
}
