import 'package:equatable/equatable.dart';

import 'meal.dart';

class FoudDetailbyid extends Equatable {
  final List<Meall>? meals;

  const FoudDetailbyid({this.meals});

  factory FoudDetailbyid.fromJson(Map<String, dynamic> json) {
    return FoudDetailbyid(
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meall.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [meals];
}
