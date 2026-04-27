import 'package:appfoud/feature/foud_detail_by_category/core/api_service_by_category.dart';
import 'package:appfoud/feature/foud_detail_by_category/home/foud_detail_by_category/foud_detail_by_category_impl.dart';
import 'package:appfoud/feature/foud_detail_by_category/presentation/cubit/foud_detail_by_category.dart';
import 'package:appfoud/feature/foud_detail_by_category/presentation/cubit/foud_detail_by_category_cubit.dart';
import 'package:appfoud/feature/my_favorate/home/models/favorate_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class FouddetailById extends StatefulWidget {
  final dynamic id;
  const FouddetailById({super.key, required this.id});

  @override
  State<FouddetailById> createState() => _FouddetailByIdState();
}

class _FouddetailByIdState extends State<FouddetailById> {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<FavorateModel>('favoraties');
    return BlocProvider(
      create: (context) {
        final cubit = FoudDetailByCategoryCubit(
          FoudDetailByCategoryImpl(
            apiservicebycategory: ApiServiceByCategory(dio: Dio()),
          ),
        );
        cubit.getfoudeatilbyid(idd: widget.id);
        return cubit;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: BlocBuilder<FoudDetailByCategoryCubit, FoudDetailByCategory>(
            builder: (context, state) {
              if (state is Fouddetailbycategoryfailure) {
                return Center(child: Text(state.error));
              } else if (state is Fouddetailbycategorysucces) {
                return Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        state.meal.first.strMealThumb.toString(),
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.error),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      top: 250,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.meal.first.strMeal.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0F172A),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff0F172A),
                                ),
                              ),
                              SizedBox(height: 20),

                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Color(0xffFF6E42),
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  Text(
                                    state.meal.first.strIngredient1.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff475569),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 20,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          //   SizedBox(width: 20),
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                            ),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                bool isfav = box.containsKey(
                                  state.meal.first.idMeal,
                                );
                                if (box.isEmpty) {
                                  return Center(child: Text('not foud'));
                                }
                                return IconButton(
                                  onPressed: () {
                                    if (isfav) {
                                      box.delete(state.meal.first.idMeal);
                                    } else {
                                      box.put(
                                        state.meal.first.idMeal,
                                        FavorateModel(
                                          idmeal: state.meal.first.idMeal
                                              .toString(),
                                          strmeal: state.meal.first.strMeal
                                              .toString(),
                                          strmealthumb: state
                                              .meal
                                              .first
                                              .strMealThumb
                                              .toString(),
                                        ),
                                      );
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    isfav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
