import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wagba/core/failures/failures.dart';

abstract class BaseAuthRepo{

  Future<Either<Failure,UserCredential>> signInWithEmailAndPassword({required String email, required String password});

  Future<Either<Failure,UserCredential>> signInWithGoogle();

  Future<Either<Failure,UserCredential>> signInWithFacebook();

}