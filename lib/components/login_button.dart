import 'package:crud_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn(
      {super.key,
      required this.label,
      this.icon,
      required this.onPress,
      this.width,
      this.backgroundColor,
      this.labelColor,
      this.loading});

  final String label;
  final IconData? icon;
  final double? width;
  final Color? backgroundColor;
  final Color? labelColor;
  final bool? loading;

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: width ?? 182,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1150),
          ),
          backgroundColor: backgroundColor ?? lightbgColor,
          maximumSize: const Size(double.infinity, double.infinity),
          shadowColor: lightTextColor,
        ),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading != null && loading == true
                  ? const CircularProgressIndicator(
                      backgroundColor: lightbgColor,
                      color: lightPrimaryColor,
                      strokeWidth: 5,
                      strokeCap: StrokeCap.round,
                    )
                  : Text(
                      label,
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                        color: labelColor ?? lightTextColor,
                        fontSize: 25,
                      )),
                    ),
              // const SizedBox(
              //   width: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
