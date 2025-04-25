import 'package:fpdart/fpdart.dart';
import '../../../core/api/api.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/data/model/forgot_password.dart';
import '../../../core/data/model/login.dart';
import '../../../core/storage/istorage.dart';
import 'auth_repository_contract.dart';

class AuthRepository implements IAuthRepository {
  final LocalStorage localStorage;
  final ApiServices apiServices;

  AuthRepository({required this.localStorage, required this.apiServices});

  @override
  Future<Either<Failure, ApiResponse<Login>>> login(
    String username,
    String password,
  ) => apiServices.login(username, password);

  @override
  Future<Either<Failure, ApiResponse<ForgotPassword>>> forgotPassword(
    String email,
  ) => apiServices.forgotPassword(email);

  @override
  Future<Either<Failure, ApiResponse<ForgotPassword>>> changePassword(
          String token, String otp, String password) =>
      apiServices.changePassword(token, otp, password);


  @override
  Future<void> openDb(String username) => localStorage.openDb(username);

  @override
  Future<void> closeDb() => localStorage.closeDb();

  @override
  Future<Login> getUser() => localStorage.getLoggedInUser();

  @override
  Future<void> setRememberMe(bool value) => localStorage.setRememberMe(value);

  @override
  Future<void> setUsername(String value) => localStorage.setUsername(value);

  @override
  Future<String?> getUsername() => localStorage.getUsername();
}
