// ignore_for_file: must_be_immutable

import 'package:do_it/utils/ui.dart';
import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  const InputBox(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.obscureText});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: pastelPink),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: pink),
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(
          widget.label,
          style: const TextStyle(color: grey, fontSize: 17),
        ),
        filled: true,
        fillColor: white,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: grey, fontSize: 14),
        contentPadding: const EdgeInsets.all(20),
      ),
      cursorColor: orange,
    );
  }
}

class InputBoxPassword extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  bool obscureText;
  InputBoxPassword(
      {super.key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.obscureText});

  @override
  State<InputBoxPassword> createState() => _InputBoxPasswordState();
}

class _InputBoxPasswordState extends State<InputBoxPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: orange),
            borderRadius: BorderRadius.circular(10),
          ),
          label: Text(
            widget.label,
            style: const TextStyle(color: grey, fontSize: 17),
          ),
          filled: true,
          fillColor: white,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: grey, fontSize: 14),
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: Image.asset(
                    "assets/icons/eye.png",
                    height: 25,
                    width: 25,
                  ))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    });
                  },
                  icon: Image.asset(
                    "assets/icons/bar_eye.png",
                    height: 25,
                    width: 25,
                  ))),
      cursorColor: pink,
    );
  }
}
