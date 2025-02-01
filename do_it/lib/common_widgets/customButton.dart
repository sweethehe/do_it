// ignore_for_file: must_be_immutable

import 'package:do_it/utils/ui.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  void Function()? onPressed;
  final String text;
  final Color myColor;
  final double width;
  CustomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.myColor,
      required this.width});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      minWidth: widget.width,
      color: widget.myColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(15),
      child: Text(
        widget.text,
        style: const TextStyle(
          color:white,
          fontSize: 18,
        ),
      ),
    );
  }
}