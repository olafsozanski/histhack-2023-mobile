class Address {
  Address({
    required this.streetName,
    required this.streetNumber,
    required this.city,
  });

  String streetName;
  String streetNumber;
  String city;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetName: json["streetName"],
        streetNumber: json["streetNumber"],
        city: json["city"],
      );
}
