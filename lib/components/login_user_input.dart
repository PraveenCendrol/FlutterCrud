import 'package:crud_app/constants/colors.dart';
import 'package:flutter/material.dart';

class LoginUserInput extends StatefulWidget {
  const LoginUserInput(
      {super.key,
      required this.controller,
      required this.placeholder,
      this.icon,
      this.password});
  final TextEditingController controller;
  final String placeholder;

  final bool? password;
  final IconData? icon;

  @override
  State<LoginUserInput> createState() => _LoginUserInputState();
}

class _LoginUserInputState extends State<LoginUserInput> {
  late FocusNode _inputFocusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _inputFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: FocusScope(
        child: Focus(
          onFocusChange: (value) {
            setState(() {
              _isFocused = value;
            });
          },
          child: TextField(
            focusNode: _inputFocusNode,
            controller: widget.controller,
            style: const TextStyle(fontSize: 15),
            cursorColor: lightSecondaryColor,
            obscureText: widget.password == null || widget.password == false
                ? false
                : true,
            decoration: InputDecoration(
              prefixIcon: widget.icon == null
                  ? null
                  : Icon(
                      widget.icon,
                      color: _isFocused == true
                          ? lightSecondaryColor
                          : lightPrimaryColor,
                    ),
              prefixIconColor: lightSecondaryColor,
              filled: true,
              fillColor: lightbgColor,
              hintText: widget.placeholder,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  )),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
