import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository{
  Future<void> login({required String email, required String password });
  Future<void> signup({required String email, required String password });
  User? getCurrentUser();
  Future<void> signOut();
}