import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Googleetfacebooketiphone extends StatelessWidget {
  const Googleetfacebooketiphone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
          ),
          alignment: Alignment.center,
          child: Image.asset('assets/iphone.png', width: 54, height: 54),
        ),

        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
          ),
          child: Image.asset('assets/google.png', width: 54, height: 54),
        ),

        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
          ),
          child: Image.asset('assets/fcb.png', width: 54, height: 54),
        ),
      ],
    );
  }
}
