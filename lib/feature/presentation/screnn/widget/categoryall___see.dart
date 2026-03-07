import 'package:flutter/material.dart';

class Categorall___see extends StatelessWidget {
  const Categorall___see({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff0F172A),
          ),
        ),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xffFF6E42),
          ),
        ),
      ],
    );
  }
}
