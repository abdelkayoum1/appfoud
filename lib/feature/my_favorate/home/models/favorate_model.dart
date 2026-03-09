import 'package:hive_flutter/hive_flutter.dart';
part 'favorate_model.g.dart';

@HiveType(typeId: 0)
class FavorateModel extends HiveObject {
  @HiveField(0)
  final String idmeal;

  @HiveField(1)
  final String strmeal;
  @HiveField(2)
  final String strmealthumb;

  FavorateModel({
    required this.idmeal,
    required this.strmeal,
    required this.strmealthumb,
  });
}
