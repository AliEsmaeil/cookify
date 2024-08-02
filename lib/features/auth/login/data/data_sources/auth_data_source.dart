import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wagba/core/failures/auth_failure.dart';
import 'package:wagba/core/failures/base_failure.dart';
import'package:flutter_facebook_auth/flutter_facebook_auth.dart';


abstract class BaseAuthDataSource{
  
  final _instance = FirebaseAuth.instance;
  
  Future<Either<Failure,UserCredential>> signInWithEmailAndPassword({required String email, required String password});

  Future<Either<Failure,UserCredential>> signInWithGoogle();

  Future<Either<Failure,UserCredential>> signInWithFacebook();

}

class AuthDataSource extends BaseAuthDataSource{


  @override
  Future<Either<Failure,UserCredential>> signInWithEmailAndPassword({required String email, required String password}) async{
    
    try{
      return Right(await _instance.signInWithEmailAndPassword(email:email, password: password));
    }
    on FirebaseAuthException catch(e){
      print(e);
      print(e.code);
      print(e.message);
      print(e.stackTrace);

      return Left(AuthFailure(authException: e));

    }
    catch(e){
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure,UserCredential>> signInWithGoogle()async {

    try{
      // Trigger the authentication :flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if(googleUser == null){
        return Left(UncompletedAuthFailure());
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return Right(await _instance.signInWithCredential(credential));
    }
    catch(e, s){
      print(e.toString());
      print(s);

      return Left(UnknownFailure(message :e.toString()));
    }
  }

  @override
  Future<Either<Failure,UserCredential>> signInWithFacebook()async{

    try{
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      return Right(await _instance.signInWithCredential(facebookAuthCredential));
    }
    on FirebaseAuthException catch(e){
      print(e.code);
      print(e.message);
      print(e.stackTrace);
      return Left(AuthFailure(authException: e));
    }
    catch(e,s){
      print(e.toString());
      print(s);
      return Left(UnknownFailure(message: e.toString()));
    }

  }
  
}