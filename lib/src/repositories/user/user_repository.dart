import '../../core/exceptions/auth_exception.dart';
import '../../core/functionalProgramming/either.dart';

abstract interface class UserRepository {

  Future<Either<AuthException, String>> login(String email, String password);
}