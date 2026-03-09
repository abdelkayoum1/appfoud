import 'package:appfoud/core/approute.dart';
import 'package:appfoud/feature/foud_detail/presentation/cubit/cubit/foud_detail_cubit.dart';
import 'package:appfoud/feature/foud_detail/presentation/screen/widget/container_listviews.dart';
import 'package:appfoud/feature/presentation/cubit/cubit/foud_home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ContainerlistviewsItem extends StatelessWidget {
  final String meal;
  const ContainerlistviewsItem({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoudDetailCubit, FoudDetailState>(
      builder: (context, state) {
        if (state is FoudDetailfailure) {
          return Center(child: Text(state.error));
        } else if (state is FoudDetailsucces) {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: meal.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    Approute.fouddetailid,
                    extra: state.foudetail[index].idMeal,
                  );
                  print(state.foudetail[index].idMeal);
                },
                child: Containerlistviews(meal: state.foudetail[index]),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
