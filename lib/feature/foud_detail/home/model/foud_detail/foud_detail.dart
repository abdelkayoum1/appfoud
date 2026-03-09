import 'package:equatable/equatable.dart';

import 'meal.dart';

class FoudDetail extends Equatable {
  final List<Meal>? meals;

  const FoudDetail({this.meals});

  factory FoudDetail.fromJson(Map<String, dynamic> json) => FoudDetail(
    meals: (json['meals'] as List<dynamic>?)
        ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
