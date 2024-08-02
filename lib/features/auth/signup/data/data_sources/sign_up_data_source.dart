import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/failures.dart';

abstract class BaseSignUpDataSource{

  final _instance = FirebaseAuth.instance;
  Future<Either<Failure, UserCredential>> signUpWithEmailPassword({required String email, required String password});

  }

  class SignUpDataSource extends BaseSignUpDataSource{
  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailPassword({required String email, required String password})async{
    try{

      return Right(await _instance.createUserWithEmailAndPassword(email: email, password: password));
    }
    on FirebaseAuthException catch(e){
      return Left(AuthFailure(authException: e));
    }
    catch(e){
      return Left(UnknownFailure(message: e.toString()));
    }
  }
  }