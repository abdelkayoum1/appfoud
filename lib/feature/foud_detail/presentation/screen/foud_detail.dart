import 'package:appfoud/core/appservice.dart';
import 'package:appfoud/feature/foud_detail/core/api_servicedetail.dart';
import 'package:appfoud/feature/foud_detail/home/detail_home_repo/detail_home_repo_impl.dart';
import 'package:appfoud/feature/foud_detail/home/model/foud_detail/meal.dart';
import 'package:appfoud/feature/foud_detail/presentation/cubit/cubit/foud_detail_cubit.dart';
import 'package:appfoud/feature/foud_detail/presentation/screen/widget/container_listviews.dart';
import 'package:appfoud/feature/foud_detail/presentation/screen/widget/containerlistviewsitem.dart';
import 'package:appfoud/feature/presentation/cubit/cubit/foud_home_cubit.dart';
import 'package:appfoud/feature/presentation/home/home_repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoudDetail extends StatelessWidget {
  final String meal;
  const FoudDetail({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = FoudDetailCubit(
          DetailHomeRepoImpl(apidetail: ApiServicedetail(dio: Dio())),
        );
        cubit.getfoudeatail(category: meal);
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('chicken'),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: SingleChildScrollView(
              child: Column(children: [ContainerlistviewsItem(meal: meal)]),
            ),
          ),
        ),
      ),
    );
  }
}
