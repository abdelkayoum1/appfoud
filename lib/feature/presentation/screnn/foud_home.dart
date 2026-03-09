import 'package:appfoud/core/appservice.dart';
import 'package:appfoud/feature/presentation/screnn/widget/categoryall___see.dart';
import 'package:appfoud/feature/presentation/screnn/widget/categoryitemlistviews.dart';
import 'package:appfoud/feature/presentation/screnn/widget/categorylistviews.dart';
import 'package:appfoud/feature/presentation/screnn/widget/foudappbar.dart';
import 'package:appfoud/feature/presentation/screnn/widget/text_fieledd.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FoudHome extends StatelessWidget {
  const FoudHome({super.key});

  @override
  Widget build(BuildContext context) {
    //print(Appservice(dio: Dio()).getfood());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15),
          child: Column(
            children: [
              Foudhomeapp(text: 'Recipe Finder'),
              SizedBox(height: 10),

              Textfieledd(),
              SizedBox(height: 10),
              Categorall___see(),

              SizedBox(height: 10),
              Expanded(child: Categoryitemlistviews()),
            ],
          ),
        ),
      ),
    );
  }
}
