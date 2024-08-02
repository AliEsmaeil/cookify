import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'dart:math';

sealed class LoginScreenStates extends Equatable{
  const LoginScreenStates();
}

final class LoginScreenInitialState extends LoginScreenStates{
  @override
  List<Object?> get props => [];
}

final class LoginScreenLoadingState extends LoginScreenStates{

  const LoginScreenLoadingState();
  @override
  List<Object?> get props => [];
}

final class LoginScreenSuccessLoginState extends LoginScreenStates{

  final UserCredential userCredential;

  const LoginScreenSuccessLoginState({required this.userCredential});

  @override
  List<Object?> get props => [userCredential];
}


final class LoginScreenLoginFailureState extends LoginScreenStates{

  final Failure failure;

  const LoginScreenLoginFailureState({required this.failure});

  @override
  List<Object?> get props =>[failure];
}

final class LoginScreenTogglePasswordState extends LoginScreenStates{

  // just trick props because that state may be emitted many times sequentially (as user wants to see his password)
  // so, i need to encapsulate a boolean variable (whether that text visible or not ) despite YAGNI
  // YAGNI : stands for (You Aren't Gonna Need It) i will not use it!

  final bool isVisible;
  const LoginScreenTogglePasswordState({required this.isVisible});

  @override
  List<Object?> get props => [isVisible];

}