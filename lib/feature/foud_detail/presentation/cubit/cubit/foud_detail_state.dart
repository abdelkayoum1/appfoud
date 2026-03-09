part of 'foud_detail_cubit.dart';

sealed class FoudDetailState extends Equatable {
  const FoudDetailState();

  @override
  List<Object> get props => [];
}

final class FoudDetailInitial extends FoudDetailState {}

final class FoudDetailloading extends FoudDetailState {}

final class FoudDetailsucces extends FoudDetailState {
  final List<Meal> foudetail;

  const FoudDetailsucces({required this.foudetail});
}

final class FoudDetailfailure extends FoudDetailState {
  final String error;

  const FoudDetailfailure({required this.error});
}
