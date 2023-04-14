import 'dart:ffi';

import 'package:histhack_2023_mobile/data/address.dart';
import 'package:histhack_2023_mobile/data/events.dart';
import 'package:histhack_2023_mobile/data/links.dart';
import 'package:histhack_2023_mobile/data/models.dart';
import 'package:histhack_2023_mobile/data/photos.dart';

class Place {
  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.cords,
    required this.links,
    required this.photos,
    required this.events,
    required this.models,
  });

  String id;
  String name;
  Address address;
  List<double> cords;
  List<Link> links;
  List<Photo> photos;
  List<Event> events;
  List<Model> models;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["_id"],
        name: json["name"],
        address: Address.fromJson(json["address"]),
        cords: json["cords"]
            .map<double>((number) => double.parse(number.toString()))
            .toList(),
        links: json["links"].map<Link>((link) => Link.fromJson(link)).toList(),
        photos: json["photos"]
            .map<Photo>((photo) => Photo.fromJson(photo))
            .toList(),
        events: json["events"]
            .map<Event>((event) => Event.fromJson(event))
            .toList(),
        models: json["models"]
            .map<Model>((model) => Model.fromJson(model))
            .toList(),
      );
}
