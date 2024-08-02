import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/base_failure.dart';

abstract class BaseSignUpRepo{

  const BaseSignUpRepo();
  Future<Either<Failure, UserCredential>> signUpWithEmailPassword({required String email, required String password});

}