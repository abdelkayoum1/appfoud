part of 'signin_cubit_cubit.dart';

sealed class SigninCubitState extends Equatable {
  const SigninCubitState();

  @override
  List<Object> get props => [];
}

final class SigninCubitInitial extends SigninCubitState {}

final class SignCubitloading extends SigninCubitState {}

final class SignCubitsucces extends SigninCubitState {
  final String email, password;
  const SignCubitsucces({required this.email, required this.password});
}

final class SignCubitfailure extends SigninCubitState {
  final String error;
  const SignCubitfailure({required this.error});
}
