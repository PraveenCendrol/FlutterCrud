import 'package:flutter/material.dart';

class StackLogin extends StatelessWidget {
  const StackLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 0),
      child: SizedBox(
        height: 380,
        child: Stack(
          children: [
            Positioned(
              bottom: 22,
              right: 10,
              child: Opacity(
                opacity: .1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      height: 300,
                      width: 263,
                      color: Colors.white,
                    )),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 5,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: .2,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      height: 300,
                      width: 273,
                      color: Colors.white,
                    )),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                "lib/assets/welcome.avif",
                fit: BoxFit.cover,
                scale: 1,
                height: 342,
                width: 283,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
