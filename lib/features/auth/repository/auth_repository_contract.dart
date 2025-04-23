import 'package:fpdart/fpdart.dart';
import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/services/contracts/api_response.dart';
import '../../../core/data/model/forgot_password.dart';
import '../../../core/data/model/login.dart';

abstract class IAuthRepository {
  Future<Either<Failure, ApiResponse<Login>>> login(
    String username,
    String password,
  );
  Future<Either<Failure, ApiResponse<ForgotPassword>>> forgotPassword(
    String email,
  );

  Future<Either<Failure, ApiResponse<ForgotPassword>>> changePassword(
    String token,
    String otp,
    String password,
  );

  Future<void> openDb(String username);
  Future<void> closeDb();
  Future<Login> getUser();
  Future<void> setRememberMe(bool value);
  Future<void> setUsername(String value);
  Future<String?> getUsername();
}
