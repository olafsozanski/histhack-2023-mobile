import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:histhack_2023_mobile/dio.dart';
import 'package:histhack_2023_mobile/main.dart';
import 'package:histhack_2023_mobile/screens/places_screen.dart';

class ArCameraScreen extends StatefulWidget {
  static const routeName = "/screens/ar_camera_screen";

  const ArCameraScreen({Key? key}) : super(key: key);

  @override
  State<ArCameraScreen> createState() => _ArCameraScreen();
}

class _ArCameraScreen extends State<ArCameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  void initState() {
    super.initState();
    onNewCameraSelected(cameras[0]);
    getPlaces().then((places) async {
      await Future.delayed(Duration(seconds: 5));
      Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => PlacesScreen(place: places[0])));
    });
  }

  Widget buildCamera() {
    return _isCameraInitialized ? controller!.buildPreview() : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildCamera(),
          Container(
            width: 196,
            height: 128,
            child: Center(
                child: Text(
              'Nakieruj na obiekt',
              style: TextStyle(color: Colors.white),
            )),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Text("Powrót"),
        icon: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
