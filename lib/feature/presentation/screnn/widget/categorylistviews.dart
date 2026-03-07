import 'package:flutter/material.dart';

class Categorylistviews extends StatelessWidget {
  const Categorylistviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/Image+Background.png'),
        Positioned(
          bottom: 60,
          left: 10,
          child: Text(
            'Beef',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'Plus Jakarta Sans',
            ),
          ),
        ),
      ],
    );
  }
}
