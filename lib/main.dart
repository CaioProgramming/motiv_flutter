import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motiv_flutter/Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Motiv',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            appBarTheme: AppBarTheme(
                elevation: 1,
                backgroundColor: Colors.white,
                textTheme: GoogleFonts.josefinSansTextTheme(),
                actionsIconTheme: IconThemeData(color: Colors.black),
                iconTheme: IconThemeData(color: Colors.black))),
        home: HomeScreen());
  }
}
