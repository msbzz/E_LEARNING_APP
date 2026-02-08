import 'package:e_learning_app/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChanged extends AuthEvent {
  final UserModel? user;

  const AuthStateChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class RegisterRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final UserRole role;

  const RegisterRequested({
    required this.email,
    required this.password,
    required this.fullName,
    required this.role,
  });

  @override
  List<Object> get props => [email, password, fullName, role];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LogoutRequested extends AuthEvent {
  final String email;

  const LogoutRequested({required this.email});

  @override
  List<Object> get props => [email];
}
