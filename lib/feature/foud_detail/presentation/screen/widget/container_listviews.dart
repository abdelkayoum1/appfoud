import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/model/foud_detail_byid/foud_detailbyid/meal.dart';
import 'package:appfoud/feature/presentation/home/modell/foud_model/category.dart';
import 'package:flutter/material.dart';

class Containerlistviews extends StatelessWidget {
  final Meal meal;
  const Containerlistviews({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              meal.strMealThumb.toString(),
            ),
          ),
          Positioned(
            top: 90,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // width: double.infinity,
              //  height: 50,
              color: Colors.white,
              child: Text(
                meal.strMeal.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0F172A),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
