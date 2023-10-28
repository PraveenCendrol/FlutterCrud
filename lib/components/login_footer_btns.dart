import 'package:crud_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFotterBtn extends StatelessWidget {
  const LoginFotterBtn({super.key, required this.label, required this.onPress});

  final String label;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        label,
        style: GoogleFonts.raleway(
            textStyle: const TextStyle(
          color: lightSecondaryColor,
          fontSize: 15,
        )),
      ),
    );
  }
}
