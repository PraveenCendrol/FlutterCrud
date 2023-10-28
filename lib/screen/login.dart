import 'package:crud_app/components/login_button.dart';
import 'package:crud_app/components/login_footer_btns.dart';
import 'package:crud_app/components/stack_login.dart';
import 'package:crud_app/constants/colors.dart';
import 'package:crud_app/river_pod/login_provider.dart';
import 'package:crud_app/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _WelcomeScreen();
  }
}

class _WelcomeScreen extends ConsumerState<WelcomeScreen> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var slide = ref.watch(currentSlide) == "welcome"
        ? SizedBox(
            key: const ValueKey<int>(0),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginBtn(
                  icon: Icons.login,
                  label: "Get Started",
                  onPress: () {
                    setState(() {
                      ref
                          .read(currentSlide.notifier)
                          .update((state) => "login");
                    });
                  },
                ),
              ],
            ),
          )
        : SizedBox(
            key: const ValueKey<int>(1),
            height: 150,
            child: Column(
              children: [
                LoginBtn(
                  icon: Icons.login,
                  label: "Login",
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen(screenName: "Login")));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                LoginBtn(
                  icon: Icons.login,
                  label: "Sign up",
                  onPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const LoginScreen(screenName: "Sign up")));
                  },
                ),
              ],
            ),
          );

    return SafeArea(
      child: Scaffold(
        body: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StackLogin(),
              Text(
                "Welcome",
                style: GoogleFonts.raleway(
                    textStyle:
                        const TextStyle(fontSize: 28, color: lightTextColor)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: Text(
                  "Welcome CRUD Shopping Simplify Shopping experiecne.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: lightTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.linear,
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                          scale: animation,
                          child: child,
                        );
                      },
                      child: slide,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: lightbgColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              LoginFotterBtn(
                                label: "Contact",
                                onPress: () {},
                              ),
                              LoginFotterBtn(
                                label: "Terms and Conditions",
                                onPress: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
