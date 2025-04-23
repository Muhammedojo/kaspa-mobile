import 'package:local_auth/local_auth.dart';

import 'local_auth.dart';

class LocalAuthImpl implements LocalAuth {
   @override
  Future<bool> authenticate() async {
    final auth = LocalAuthentication();
    try {
      return await auth.authenticate(
        localizedReason: "localizedReason",
        options: const AuthenticationOptions(stickyAuth: true),
      );
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> cancelAuthentication() {
    throw UnimplementedError();
  }

  @override
  Future<bool> get isAvailable async =>
      LocalAuthentication().canCheckBiometrics;
}
