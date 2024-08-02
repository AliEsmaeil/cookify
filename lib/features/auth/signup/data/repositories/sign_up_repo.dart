import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wagba/core/failures/failures.dart';
import 'package:wagba/features/auth/signup/data/data_sources/sign_up_data_source.dart';
import 'package:wagba/features/auth/signup/domain/repositories/base_sign_up_repo.dart';

class SignUpRepo extends BaseSignUpRepo{

  final BaseSignUpDataSource dataSource;

  const SignUpRepo({required this.dataSource});

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmailPassword({required String email, required String password})async{
    return await dataSource.signUpWithEmailPassword(email: email, password: password);
  }

}