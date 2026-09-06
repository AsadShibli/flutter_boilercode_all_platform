import 'package:firebase_auth/firebase_auth.dart';
import '../domain/app_user.dart';
import '../domain/auth_repository.dart';
import '../domain/user_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  FirebaseAuthRepository(this._firebaseAuth, this._userRepository);

  // Map Firebase User to our domain AppUser
  AppUser? _mapFirebaseUser(User? user) {
    if (user == null) return null;
    return AppUser(id: user.uid, email: user.email);
  }

  @override
  Stream<AppUser?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_mapFirebaseUser);
  }

  @override
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      // In a production app, map this to a custom Domain Exception
      throw Exception(e.message); 
    }
  }

  @override
  Future<void> signUpWithEmail(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        // Orchestrate the Firestore document creation immediately after Auth succeeds
        final newUser = AppUser(id: firebaseUser.uid, email: firebaseUser.email);
        await _userRepository.createUserDocument(newUser);
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}