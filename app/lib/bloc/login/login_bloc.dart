import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/model/user_model.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/repo/user_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginRepository loginRepository,
    required UserRepository userRepository,
  })  : _loginRepository = loginRepository,
        _userRepository = userRepository,
        super(const LoginState.unknown()) {
    on<LoginStatusChanged>(_onLoginStatusChanged);
    on<LogoutRequested>(_onLogoutRequested);
    _loginStatusSubscription = _loginRepository.status.listen(
      (status) => add(LoginStatusChanged(status)),
    );
  }

  final LoginRepository _loginRepository;
  final UserRepository _userRepository;
  late StreamSubscription<LoginStatus> _loginStatusSubscription;

  @override
  Future<void> close() {
    _loginStatusSubscription.cancel();
    _loginRepository.dispose();
    return super.close();
  }

  void _onLoginStatusChanged(
    LoginStatusChanged event,
    Emitter<LoginState> emit,
  ) async {
    switch (event.status) {
      case LoginStatus.unauthenticated:
        return emit(const LoginState.unauthenticated());
      case LoginStatus.authenticated:
        final user = await _tryGetUser();
        return emit(user != null ? LoginState.authenticated(user) : const LoginState.unauthenticated());
      default:
        return emit(const LoginState.unknown());
    }
  }

  void _onLogoutRequested(
    LogoutRequested event,
    Emitter<LoginState> emit,
  ) {
    _loginRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
