import 'package:flutter/material.dart';

class Foudhomeapp extends StatelessWidget {
  final String? text;
  const Foudhomeapp({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff0F172A),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Color(0xffFF6E42)),
        ),
      ],
    );
  }
}
