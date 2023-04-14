import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:histhack_2023_mobile/screens/home_screen.dart';
import 'package:histhack_2023_mobile/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HistAR',
      home: HomeScreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('pl'),
      supportedLocales: [
        Locale('pl'),
      ],
      theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: AppTheme.colors.primary,
          scaffoldBackgroundColor: AppTheme.colors.appBackground,
          appBarTheme: AppBarTheme(
              elevation: 0,
              titleTextStyle: AppTheme.typography.headline6
                  ?.copyWith(fontSize: 20, color: Colors.white)),
          textTheme: AppTheme.typography,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.zero),
            fillColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppTheme.colors.primary,
          ),
          outlinedButtonTheme: const OutlinedButtonThemeData(
              style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
          )),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
            elevation: MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            )),
          ))),
    );
  }
}
