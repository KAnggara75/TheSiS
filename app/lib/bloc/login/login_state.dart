part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  const LoginState._({
    this.status = LoginStatus.unknown,
    this.user = User.empty,
  });

  const LoginState.unknown() : this._();

  const LoginState.authenticated(User user) : this._(status: LoginStatus.authenticated, user: user);

  const LoginState.unauthenticated() : this._(status: LoginStatus.unauthenticated);

  final LoginStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
