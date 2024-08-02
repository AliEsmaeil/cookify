import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/auth/login/domain/repositories/base_auth_repo.dart';

final class AuthUseCases{

  final BaseAuthRepo _repo;

  AuthUseCases({required BaseAuthRepo repo}): _repo = repo;

  Future<Either<Failure,UserCredential>> signInWithEmailAndPassword({required String email, required String password})async{
    return await _repo.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<Either<Failure,UserCredential>> signInWithGoogle()async{
    return await _repo.signInWithGoogle();
  }

  Future<Either<Failure,UserCredential>> signInWithFacebook()async{
    return await _repo.signInWithFacebook();
  }
}