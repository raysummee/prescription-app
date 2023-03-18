import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  
  AuthenticationBloc(this._authenticationRepository) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is AuthenticationStarted) {
        User? user = _authenticationRepository.getCurrentUser();
        if (user!=null) {
          emit(AuthenticationSuccess(
            uid: user.uid,
          ));
        } else {
          emit(AuthenticationFailure());
        }
      }
      else if(event is AuthenticationSignedOut){
        await _authenticationRepository.signOut();
        emit(AuthenticationFailure());
      }
    });
  }
}
