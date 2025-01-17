part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginUserEvent extends LoginEvent {
  final String phone;
  final String password;

  LoginUserEvent({required this.phone, required this.password});
}
