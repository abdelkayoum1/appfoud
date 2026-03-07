import 'package:appfoud/feature/presentation/screnn/widget/categorylistviews.dart';
import 'package:flutter/material.dart';

class Categoryitemlistviews extends StatelessWidget {
  const Categoryitemlistviews({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,

        //  mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        return Categorylistviews();
      },
    );
  }
}
