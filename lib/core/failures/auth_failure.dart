
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/base_failure.dart';

final class AuthFailure extends Failure{
  final FirebaseAuthException authException;

  // no need for subtyping (child classes), most FirebaseAuthException codes are descriptive and meaningful
  AuthFailure({required this.authException }) :super(message: authException.code);
}



final class UncompletedAuthFailure extends Failure{

  UncompletedAuthFailure():super(message: "Uncompleted Authentication");
}
