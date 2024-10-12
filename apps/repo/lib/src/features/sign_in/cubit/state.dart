import 'package:common_features/auth/domain/entity/login_response/login_response.dart';
import 'package:common_features/common_features.dart';
import 'package:repo/src/core/base/base_state.dart';

class SigninState extends BaseState {
  const SigninState({
    super.pageState,
    super.message,
    super.errorType,
    this.loginResponse,
  });

  final LoginResponseEntity? loginResponse;

  @override
  SigninState copyWith({
    PageState? pageState,
    String? message,
    ErrorType? errorType,
    LoginResponseEntity? loginResponse,
  }) {
    return SigninState(
      pageState: pageState ?? this.pageState,
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  String toString() {
    return '${super.toString()} SigninState{loginResponse: $loginResponse}';
  }

  @override
  List<Object?> get props => [
        pageState,
        message,
        errorType,
        loginResponse,
      ];
}
