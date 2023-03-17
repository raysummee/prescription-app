
import 'package:flutter/material.dart';

import 'base_validator.dart';

class Validator{
  static FormFieldValidator<String> validateEquality(String string, String errorMsg) {
    return (value){
      if(value==string){
        return null;
      }else{
        return errorMsg;
      }
    };
  }

  static FormFieldValidator<String> get validateEmail {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Email should not be empty"),
      BaseValidator.validateRegex(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)",
        "Invalid Email")
    ]);
  }
  static FormFieldValidator<String> validateNonull(String inputName) {
    return BaseValidator.validateRegex(r".+", "$inputName should not be empty");
  }

  static FormFieldValidator<String> get validateFullname {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Name should not be empty"),
    ]);
  }

  static FormFieldValidator<String> validatePhone() {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Phone should not be empty"),
      BaseValidator.validateRegex(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$", "Phone number is not valid")
    ]);
  }

  static FormFieldValidator<String> get validatePassword {
    return BaseValidator.validateRegex(r".+", "Password should not be empty");
  }

  static FormFieldValidator<String> validateConfirmPassword(String password) {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Confirm password should not be empty"),
      validateEquality(password, "Confirm password doesn't mactch")
    ]);
  }

  static FormFieldValidator<String> validateUsername() {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Username should not be empty"),
    ]);
  }

  static FormFieldValidator<String> get validateDate {
    return BaseValidator.validate([
      BaseValidator.validateRegex(r".+", "Date should not be empty"),
      BaseValidator.validateRegex(r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$", "Date should be a date")
    ]);
  }
}