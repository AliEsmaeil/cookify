import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:wagba/core/failures/base_failure.dart';
import 'package:wagba/core/utils/password_strength_assessment.dart';
import 'package:wagba/features/auth/signup/data/data_sources/sign_up_data_source.dart';
import 'package:wagba/features/auth/signup/data/repositories/sign_up_repo.dart';
import 'package:wagba/features/auth/signup/domain/use_cases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {

  bool isPasswordVisible = false;
  late final SignUpUseCase _signUpUseCase ;

  SignUpCubit() : super(SignUpInitial()){
    _signUpUseCase = SignUpUseCase(repo: SignUpRepo(dataSource: SignUpDataSource()));
  }

  void signUp({required String email, required String password})async{

    emit(SignUpLoadingState());

    var result = await _signUpUseCase.signUpWithEmailPassword(email: email, password: password);
    result.fold(
            (failure) => emit(SignUpFailedSignUpState(failure: failure)),
            (userCredential) => emit(SignUpSuccessfulSignUpState(userCredential: userCredential))
    );
  }

  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    emit(SignUpTogglePasswordVisibilityState(isVisible: isPasswordVisible));
  }
  
  void assessPasswordStrength({required String password}){

    // 1: for less than 6 chars password
    // 2: for greater than 6 but not containing both numbers and chars
     //3: for excellent password than contains both digits and chars and it's length is over 6 chars.
    if(password.isNotEmpty){
      int strength = PasswordEvaluator.assessPassword(password: password);
      emit(SignUpChangePasswordStrengthState(strength: strength));
    }
    else{
      emit(SignUpInitial());
    }
  }

}
