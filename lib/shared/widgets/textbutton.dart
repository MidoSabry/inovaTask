import 'package:flutter/material.dart';

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style:
            TextStyle(fontFamily: 'Crimson', fontSize: 18, color: Colors.black),
      ),
    );
