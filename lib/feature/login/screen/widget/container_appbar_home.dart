import 'package:appfoud/core/error/text_style.dart';
import 'package:flutter/material.dart';

class Containerapphome extends StatelessWidget {
  const Containerapphome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red[100],
          ),
          child: Image.asset('assets/Icon (1).png', color: Colors.red),
        ),
        SizedBox(width: 80),
        Text('Recipe Finder', style: TextStylee.textblackbold18),
      ],
    );
  }
}
                //  Containerapphome(),

/*
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    //color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/Image+Background.png'),
                    ),
                  ),
                ),
                */