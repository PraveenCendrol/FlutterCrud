import 'package:crud_app/constants/colors.dart';
import 'package:crud_app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRUD",
      home: const WelcomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: lightPrimaryColor,
        textTheme: GoogleFonts.ralewayTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.raleway(textStyle: textTheme.bodyMedium),
        ),
      ),
    );
  }
}
