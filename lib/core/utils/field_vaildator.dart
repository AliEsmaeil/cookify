final class FieldValidator{
  
  static String? emailValidator(String? email){
    if(email == null || email.isEmpty){
      return 'Fill Your Email Address';
    }
    else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)){
      return 'Invalid Email Format';
    }
    return null;
  }

  static String? passwordValidator(String? password){
    if(password == null || password.isEmpty){
      return 'Fill Your Password';
    }
    else if (password.length <=6 ){
      return 'Very Weak Password';
    }
    return null;
  }

}