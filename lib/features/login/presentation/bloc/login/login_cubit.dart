import 'package:app/core/exception/app_exception.dart';
import 'package:app/core/validator/validator.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/repository/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repository) : super(LoginInitial());

  final AuthenticationRepository _repository;

  login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      var validatorError = Validator.validateEmail(email);
      if (validatorError != null) {
        throw AppException(message: validatorError);
      }
      validatorError = Validator.validatePassword(password);
      if (validatorError != null) {
        throw AppException(message: validatorError);
      }
      await _repository.login(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseException catch (_) {
      emit(const LoginError(message: "Invalid email or password"));
      rethrow;
    } on AppException catch (err) {
      emit(LoginError(message: err.message));
    }
  }

  signup(
      {required String email,
      required String password,
      required String confirm}) async {
    emit(LoginLoading());
    try {
      var validatorError = Validator.validateEmail(email);
      if (validatorError != null) {
        throw AppException(message: validatorError);
      }
      validatorError = Validator.validatePassword(password);
      if (validatorError != null) {
        throw AppException(message: validatorError);
      }
      if (password != confirm) {
        throw AppException(message: "password doesn't match confirm password");
      }
      await _repository.signup(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseException catch (_) {
      emit(const LoginError(message: "Error creating account"));
      rethrow;
    } on AppException catch (err) {
      emit(LoginError(message: err.message));
    }
  }
}
