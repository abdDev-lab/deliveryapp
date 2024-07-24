import 'package:get/get.dart';

valideInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone number";
    }
  }

  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be less than $max";
  }
}

confirmpassword(String pass, String confirmpass) {
  if (confirmpass.isEmpty) {
    return "can't be empty";
  }
  if (confirmpass != pass) {
    return "correct password";
  }
}

cardInputValid(String val, String type) {
  if (val.isEmpty) {
    return "required";
  }
  if (type == "date") {
    if (!checkdate(val)) {
      return "invalide date";
    }
  }
  if (type == "cardnumber") {
    if (val.length != 19) {
      return "invalid card number" ; 
    }
    
  }
}

checkdate(String val) {
  String mounth = "";
  String year = "";
  String currentYear = ((DateTime.now().year) % 100 - 1).toString();
  for (var i = 0; i < val.length; i++) {
    if (i < 2) {
      mounth = mounth + val[i];
    }
    if (i > 2) {
      year = year + val[i];
    }
  }
  if (mounth.compareTo("12") > 0 || year.compareTo(currentYear) < 0) {
    return false;
  } else {
    return true;
  }
}
