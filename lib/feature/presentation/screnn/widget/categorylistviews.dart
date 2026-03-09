import 'package:appfoud/core/approute.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/foud_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Categorylistviews extends StatelessWidget {
  final Category foud;
  const Categorylistviews({super.key, required this.foud});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                height: 250,
                // height: MediaQuery.of(context).size.height * .23,
                imageUrl: (foud.strCategoryThumb).toString(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),

          // Image.asset('assets/Image+Background.png'),
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              foud.strCategory.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: 'Plus Jakarta Sans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
