import 'package:flutter/material.dart';

class Textfieledd extends StatelessWidget {
  const Textfieledd({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Color(0xff94A3B8)),
        hint: Text(
          'Search recipes, ingredients...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xfF94A3B8),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black, width: 0.3),
        ),
      ),
    );
  }
}
