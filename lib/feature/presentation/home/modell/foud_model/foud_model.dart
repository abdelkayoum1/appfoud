import 'package:equatable/equatable.dart';

import 'category.dart';

class FoudModel extends Equatable {
  final List<Category>? categories;

  const FoudModel({this.categories});

  factory FoudModel.fromJson(Map<String, dynamic> json) => FoudModel(
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'categories': categories?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [categories];
}
