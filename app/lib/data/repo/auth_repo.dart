import 'dart:async';

enum LoginStatus { unknown, authenticated, unauthenticated }

class LoginRepository {
  final _controller = StreamController<LoginStatus>();

  Stream<LoginStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield LoginStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(LoginStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(LoginStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
