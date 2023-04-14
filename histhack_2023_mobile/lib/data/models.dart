class Model {
  Model({
    required this.label,
    required this.fileName,
  });

  String label;
  String fileName;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        label: json["label"],
        fileName: json["fileName"],
      );
}
