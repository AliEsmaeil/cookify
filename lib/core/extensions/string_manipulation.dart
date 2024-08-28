extension StringManipulation on String{

  String customizeForSliverOrAppBarTitle(){

    RegExp spaceRegExp = RegExp(r' ');
    // Count the number of spaces
    int spaceCount = spaceRegExp.allMatches(this).length;

    return switch(spaceCount){
      0 || 1=>this,
      _=>  substring(0, indexOf(' ', indexOf(' ')+1)),
    };
  }
}