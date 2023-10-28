import 'dart:convert';

import 'package:crud_app/components/login_button.dart';
import 'package:crud_app/components/login_user_input.dart';
import 'package:crud_app/constants/colors.dart';
import 'package:crud_app/constants/env.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.screenName});

  final String screenName;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  var loading = false;

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SnackBar snackBar(String message, bool success) {
      return SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(milliseconds: 1000),
        onVisible: () {
          if (!success) {
            _userName.text = "";
            _password.text = "";
          }
        },
        backgroundColor: const Color.fromARGB(0, 244, 241, 241),
        content: AwesomeSnackbarContent(
          title: success ? "Success" : 'Warning',
          message: message,
          contentType: success ? ContentType.success : ContentType.failure,
        ),
      );
    }

    Future<void> loginUser() async {
      const String url = "$mainUrl/login";
      print(">>called");
      setState(() {
        loading = true;
      });
      if (widget.screenName == "Login") {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': _userName.text,
            "password": _password.text,
          }),
        );

        final Map<String, dynamic> data = json.decode(response.body);
        print(">>$data");
        setState(() {
          loading = false;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar(data["message"], data["success"]));
        });
      } else {
        final response = await http.put(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': _userName.text,
            "password": _password.text,
          }),
        );

        final Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          loading = false;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar(data["message"], data["success"]));
        });
      }
    }

    return SafeArea(
        child: Scaffold(
      body: Center(
          widthFactor: double.infinity,
          heightFactor: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.screenName,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: lightTextColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.screenName == "Login"
                    ? "Hello,Welcome back"
                    : "Thanks for choosing our app",
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: lightTextColor),
              ),
              const SizedBox(
                height: 25,
              ),
              LoginUserInput(
                controller: _userName,
                placeholder: "UserName",
                icon: Icons.alternate_email,
              ),
              const SizedBox(
                height: 10,
              ),
              LoginUserInput(
                controller: _password,
                placeholder: "Password",
                password: true,
                icon: Icons.key,
              ),
              const SizedBox(
                height: 55,
              ),
              LoginBtn(
                label: widget.screenName,
                onPress: () {
                  loginUser();
                },
                labelColor: lightTextColor,
                width: MediaQuery.of(context).size.width * 0.8,
                backgroundColor: const Color(0xff82d0d7),
                loading: loading,
              ),
              const SizedBox(
                height: 55,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.screenName == "Login"
                      ? "Already have an account?"
                      : "Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen(
                              screenName: widget.screenName == "Login"
                                  ? "Sign Up"
                                  : "Login")));
                    },
                    child: Text(
                      widget.screenName == "Login" ? "Sign Up" : "Log In",
                      style: const TextStyle(color: lightSecondaryColor),
                    ),
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
