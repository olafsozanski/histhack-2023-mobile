import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:histhack_2023_mobile/data/events.dart';
import 'package:histhack_2023_mobile/data/places.dart';
import 'package:histhack_2023_mobile/dio.dart';
import 'package:histhack_2023_mobile/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class PlacesScreen extends StatefulWidget {
  static const routeName = "/screens/places_screen";

  Place place;

  PlacesScreen({Key? key, required this.place}) : super(key: key);

  @override
  State<PlacesScreen> createState() => _PlacesScreen();
}

//final Uri _url = Uri.parse('https://flutter.dev');

class _PlacesScreen extends State<PlacesScreen> {
  getEventShortDescription(Event event) {
    if (event.description.length > 48) {
      return event.description
          .replaceRange(48, event.description.length, '...');
    }
    return event.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "${baseUrl}images/${widget.place.photos[0].fileName}"),
                    fit: BoxFit.cover)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
            child: Container(),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: SafeArea(
                child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 24),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0),
                        ),
                        child: Image.network(
                            "${baseUrl}images/${widget.place.photos[0].fileName}",
                            height: 200,
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          widget.place.name,
                          style: AppTheme.typography.headline3,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(bottom: 24),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 8, left: 24, right: 24),
                        child: Text(
                          "Wydarzenia",
                          style: AppTheme.typography.headline3,
                        ),
                      ),
                      ...(widget.place.events.map<Widget>(
                        (event) => InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            child: IntrinsicHeight(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 2,
                                        height: 10,
                                        color: Colors.blueGrey.shade300,
                                      ),
                                    ),
                                    Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppTheme.colors.primary,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 2,
                                        height: 10,
                                        color: Colors.blueGrey.shade300,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(DateFormat.yMMMd('pl')
                                        .format(event.date)),
                                    Text(event.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                AppTheme.colors.textPrimary)),
                                    Text(
                                      getEventShortDescription(event),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppTheme.colors.textSecondary),
                                      softWrap: true,
                                    ),
                                  ],
                                ))
                              ],
                            )),
                          ),
                        ),
                      )),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(bottom: 24),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 24, bottom: 8, left: 24, right: 24),
                        child: Text(
                          "Linki",
                          style: AppTheme.typography.headline3,
                        ),
                      ),
                      ...(widget.place.links.map<Widget>((link) {
                        //final Uri _url = Uri.parse('https://flutter.dev');

                        return InkWell(
                          onTap: () {} /*_launchUrl*/,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            child: IntrinsicHeight(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.link),
                                const SizedBox(width: 16),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(link.title,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                AppTheme.colors.textPrimary)),
                                  ],
                                )),
                              ],
                            )),
                          ),
                        );
                      })),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        label: const Text("Powrót"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
