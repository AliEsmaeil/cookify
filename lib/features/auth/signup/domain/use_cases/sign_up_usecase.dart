import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/auth/signup/domain/repositories/base_sign_up_repo.dart';

final class SignUpUseCase{

  final BaseSignUpRepo _repo;

  const SignUpUseCase({required BaseSignUpRepo repo}): _repo = repo;

  Future<Either<Failure, UserCredential>>signUpWithEmailPassword({required String email, required String password})async{

    return await _repo.signUpWithEmailPassword(email: email, password: password);
  }
}