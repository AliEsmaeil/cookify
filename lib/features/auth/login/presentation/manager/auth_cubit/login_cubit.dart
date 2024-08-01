import 'package:bloc/bloc.dart';
import 'package:wagba/features/auth/login/data/data_sources/auth_data_source.dart';
import 'package:wagba/features/auth/login/data/repositories/auth_repo.dart';
import 'package:wagba/features/auth/login/domain/use_cases/auth_use_cases.dart';
import 'package:wagba/features/auth/login/presentation/manager/auth_cubit/login_states.dart';


class LoginCubit extends Cubit<LoginScreenStates> {
  
  late final AuthUseCases _useCases;
  bool isPasswordVisible = false;
  
  LoginCubit() : super(LoginScreenInitialState()){
    _useCases = AuthUseCases(repo: AuthRepo(dataSource: AuthDataSource()));
  }
  
  void togglePasswordVisibility(){
    isPasswordVisible = !isPasswordVisible;
    emit(LoginScreenTogglePasswordState(isVisible:  isPasswordVisible));
    }
    
  void signInWithEmailAndPassword({required String email, required String password})async{

    emit(const LoginScreenLoadingState());

   var result = await _useCases.signInWithEmailAndPassword(email: email, password: password);
   
   result.fold(
           (l) => emit(LoginScreenLoginFailureState(failure: l)),
           (r) => emit(LoginScreenSuccessLoginState(userCredential: r))
   );
   
  }
  
  void signInWithGoogle()async{

    emit(const LoginScreenLoadingState());

    var result = await _useCases.signInWithGoogle();
   
    result.fold(
            (l) => emit(LoginScreenLoginFailureState(failure: l)),
            (r) => emit(LoginScreenSuccessLoginState(userCredential: r))
    );
  }

  void signInWithFacebook()async{

    emit(const LoginScreenLoadingState());

    var result = await _useCases.signInWithFacebook();

    result.fold(
            (l) => emit(LoginScreenLoginFailureState(failure: l)),
            (r) => emit(LoginScreenSuccessLoginState(userCredential: r))
    );
  }

}
