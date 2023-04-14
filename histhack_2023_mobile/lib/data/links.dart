class Link {
  Link({
    required this.title,
    required this.link,
    required this.contentType,
  });

  String title;
  String link;
  String contentType;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        title: json["title"],
        link: json["link"],
        contentType: json["contentType"],
      );
}
