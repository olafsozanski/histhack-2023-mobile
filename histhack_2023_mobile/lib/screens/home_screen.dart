import 'package:flutter/material.dart';
import 'package:histhack_2023_mobile/data/places.dart';
import 'package:histhack_2023_mobile/dio.dart';
import 'package:histhack_2023_mobile/screens/ar_camera_screen.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/screens/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  MapboxMapController? controller;
  List<Place> _places = [];
  var _markersShown = false;

  load() async {
    _places = await getPlaces();
    //showMarkers();
  }

  // showMarkers() {
  //   if (!_markersShown && controller != null) {
  //     for (var place in _places) {
  //       controller!.addSymbol(SymbolOptions(
  //           geometry: LatLng(place.cords[0], place.cords[1]),
  //           iconImage:
  //               "https://w7.pngwing.com/pngs/731/25/png-transparent-location-icon-computer-icons-google-map-maker-marker-pen-cartodb-map-marker-heart-logo-color-thumbnail.png"));
  //     }
  //     _markersShown = true;
  //   }
  // }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        accessToken: "",
        initialCameraPosition: const CameraPosition(
            target: LatLng(52.23935100225752, 21.044959274124327), zoom: 10),
        onMapCreated: (controller) {
          this.controller = controller;
          //showMarkers();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ArCameraScreen()),
          );
        },
        label: const Text("Wejdź w AR"),
        icon: const Icon(
          Icons.view_in_ar,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
