import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/features/auth/login/data/data_sources/auth_data_source.dart';
import 'package:wagba/features/auth/login/domain/repositories/base_auth_repo.dart';

final class AuthRepo extends BaseAuthRepo {
  BaseAuthDataSource dataSource;

  AuthRepo({required this.dataSource});

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await dataSource.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    return await dataSource.signInWithGoogle();
  }

  @override
  Future<Either<Failure,UserCredential>> signInWithFacebook()async{
    return await dataSource.signInWithFacebook();
  }
}
