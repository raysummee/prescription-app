import 'package:flutter/material.dart';

abstract class BaseValidator{
  static FormFieldValidator<String> _validateRegex(String regex, String errorMsg, bool not) {
    return (value) {
      if (RegExp(regex).hasMatch(value??"")) {
        return not? errorMsg:null;
      }
      return not? null:errorMsg;
    };
  }

  static FormFieldValidator<String> validateRegex(String regex, String errorMsg) {
    return _validateRegex(regex, errorMsg, false);
  }

  static FormFieldValidator<String> validateInvertRegex(String regex, String errorMsg) {
    return _validateRegex(regex, errorMsg, true);
  }


  static FormFieldValidator<String> validate(List<FormFieldValidator<String>> validators) {
    return (value) {
      value = value?.trim();
      for (final validator in validators) {
        final validateMsg = validator(value);
        if (validateMsg != null) {
          return validateMsg;
        }
      }
      return null;
    };
  }
}