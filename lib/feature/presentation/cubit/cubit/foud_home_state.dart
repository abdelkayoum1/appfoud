part of 'foud_home_cubit.dart';

sealed class FoudHomeState extends Equatable {
  const FoudHomeState();

  @override
  List<Object> get props => [];
}

final class FoudHomeInitial extends FoudHomeState {}

final class FoudHomelaoding extends FoudHomeState {}

final class FoudHomesucces extends FoudHomeState {
  final List<Category> foud;

  const FoudHomesucces({required this.foud});
}

final class FoudHomeFailure extends FoudHomeState {
  final String error;

  const FoudHomeFailure({required this.error});
}
