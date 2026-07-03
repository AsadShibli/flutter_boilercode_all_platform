import 'app_user.dart';

// Define the contract. Any future backend (Firebase, Supabase, custom Node server) must adhere to this.
abstract class AuthRepository {
  // Add this line
  AppUser? get currentUser; 

  Stream<AppUser?> authStateChanges();
  Future<void> signInWithEmail(String email, String password);
  Future<void> signUpWithEmail(String email, String password);
  Future<void> signOut();
}