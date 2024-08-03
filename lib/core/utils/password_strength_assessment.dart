import 'dart:convert';

class PasswordEvaluator{

  /// assess the strength of the password according to :
  /// 1: if length <=6 its strength will be 1 (weak)
  /// 2: if length is greater than 6 but not containing both digits and chars will be assessed as 2 (normal)
  /// 3: if length is greater than 6 and is made up of digits and chars will be 3 (very good)
  static int assessPassword({required String password}){

    if(password.length <= 6 ){
      return 1;
    }
    else if(!_isMix(password)){
      return 2;
    }
      return 3;
  }

  static bool _isMix(String password){
    bool containsDigit = false;
    bool containsChar = false;

    for(int i = 0 ; i< password.length; i++){
      if(_isChar(utf8.decode([password.codeUnitAt(i)]))){
        containsChar = true;
      }
      else{
        containsDigit = true;
      }

      if(containsChar && containsDigit){
        return true;
      }
    }
    return (containsChar && containsDigit);
  }

  static bool  _isChar(String char){
    try{
      double.parse(char);
      return false;
    }
    catch(e){
      return true;
    }
  }
}