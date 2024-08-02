part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpStates{}

final class SignUpInitial extends SignUpStates{}

final class SignUpLoadingState extends SignUpStates{}

final class SignUpSuccessfulSignUpState extends SignUpStates{
  final UserCredential userCredential;
  SignUpSuccessfulSignUpState({required this.userCredential});
}

final class SignUpFailedSignUpState extends SignUpStates{
  final Failure failure;
  SignUpFailedSignUpState({required this.failure});
}

final class SignUpTogglePasswordVisibilityState extends SignUpStates{
  final bool isVisible;
  SignUpTogglePasswordVisibilityState({required this.isVisible});
}

final class SignUpChangePasswordStrengthState extends SignUpStates{
  // 1 : 3 you can look at the manager to see the meaning of each number
  final int strength;
  SignUpChangePasswordStrengthState({required this.strength});
}
