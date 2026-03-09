import 'package:appfoud/feature/foud_detail/core/api_servicedetail.dart';
import 'package:appfoud/feature/foud_detail/home/detail_home_repo/detail_home_repo.dart';
import 'package:appfoud/feature/foud_detail/home/detail_home_repo/detail_home_repo_impl.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail_by_category/core/api_service_by_category.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/foud_detail_by_category_impl.dart';
import 'package:appfoud/feature/foud_detail_by_category/presentation/cubit/foud_detail_by_category.dart';
import 'package:appfoud/feature/foud_detail_by_category/presentation/cubit/foud_detail_by_category_cubit.dart';
import 'package:appfoud/feature/my_favorate/home/models/favorate_model.dart';
import 'package:appfoud/feature/presentation/cubit/cubit/foud_home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class Favorate extends StatelessWidget {
  const Favorate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'MY FAvorate',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xff0F172A),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<FavorateModel>('favoraties').listenable(),
        builder: (context, Box<FavorateModel> box, _) {
          final favorate = box.values.toList();
          if (favorate.isEmpty) {
            return Center(child: Text('لاتوجد  منتجات مفضلة'));
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GridView.builder(
              itemCount: favorate.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final meal = favorate[index];
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: 150,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            meal.strmealthumb,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      meal.strmeal,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1E293B),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
