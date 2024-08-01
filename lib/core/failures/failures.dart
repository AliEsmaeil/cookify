import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure implements Exception{
  final String message;
  const Failure({required this.message});
}

final class AuthFailure extends Failure{
  final FirebaseAuthException authException;

   AuthFailure({required this.authException }) :super(message: authException.code);
}




final class UncompletedAuthFailure extends Failure{

  UncompletedAuthFailure():super(message: "Uncompleted Authentication");
}

final class UnknownFailure extends Failure{
  const UnknownFailure({required super.message});
}