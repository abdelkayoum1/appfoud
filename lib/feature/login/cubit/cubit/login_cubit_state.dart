part of 'login_cubit_cubit.dart';

sealed class LoginCubitState extends Equatable {
  const LoginCubitState();

  @override
  List<Object> get props => [];
}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitloading extends LoginCubitState {}

final class LoginCubitsucces extends LoginCubitState {
  final String email, password;
  const LoginCubitsucces({required this.email, required this.password});
}

final class LoginCubitfailure extends LoginCubitState {
  final String error;
  const LoginCubitfailure({required this.error});
}
