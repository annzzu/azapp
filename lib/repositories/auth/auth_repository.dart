import 'package:firebase_auth/firebase_auth.dart' as auth;
import './base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<auth.User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      print('momxmarebeli aris $user');
      return user;
    } catch (e) {  print('momxmarebeli არ არის $e');}
    return null;


  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}
