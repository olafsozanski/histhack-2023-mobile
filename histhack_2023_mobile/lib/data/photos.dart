class Photo {
  Photo({
    required this.label,
    required this.description,
    required this.fileName,
  });

  String label;
  String description;
  String fileName;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        label: json["label"],
        description: json["description"],
        fileName: json["fileName"],
      );
}
