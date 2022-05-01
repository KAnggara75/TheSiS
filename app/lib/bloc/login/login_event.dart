part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStatusChanged extends LoginEvent {
  const LoginStatusChanged(this.status);

  final LoginStatus status;

  @override
  List<Object> get props => [status];
}

class LogoutRequested extends LoginEvent {}
