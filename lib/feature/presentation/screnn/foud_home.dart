import 'package:appfoud/feature/presentation/screnn/widget/categoryall___see.dart';
import 'package:appfoud/feature/presentation/screnn/widget/categoryitemlistviews.dart';
import 'package:appfoud/feature/presentation/screnn/widget/categorylistviews.dart';
import 'package:appfoud/feature/presentation/screnn/widget/foudappbar.dart';
import 'package:appfoud/feature/presentation/screnn/widget/text_fieledd.dart';
import 'package:flutter/material.dart';

class FoudHome extends StatelessWidget {
  const FoudHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Foudhomeapp(text: 'Recipe Finder'),
              SizedBox(height: 10),

              Textfieledd(),
              SizedBox(height: 10),
              Categorall___see(),

              SizedBox(height: 20),
              Expanded(child: Categoryitemlistviews()),
            ],
          ),
        ),
      ),
    );
  }
}
