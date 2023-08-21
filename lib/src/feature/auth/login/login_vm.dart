import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/exceptions/service_exception.dart';
import 'package:dw_barbershop/src/core/functionalProgramming/either.dart';
import 'package:dw_barbershop/src/core/providers/application_providers.dart';
import 'package:dw_barbershop/src/feature/auth/login/login_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.inital();

  Future<void> login(String email, String password) async {

    final loaderHandle = AsyncLoaderHandler()..start();

    final loginService = ref.watch(userLoginServiceProvider);

    final result = loginService.execute(email, password);

    switch (result) {
      case Sucess():
        break;
      case Failure(exception: ServiceException(: final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
         );
        break;
    }
    loaderHandle.close();
  }
}
