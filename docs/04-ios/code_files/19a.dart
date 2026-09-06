import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/app_user.dart';
import '../domain/user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  final FirebaseFirestore _firestore;

  FirestoreUserRepository(this._firestore);

  @override
  Future<void> createUserDocument(AppUser user) async {
    // Treat the UID as the document ID for O(1) lookups
    final userDoc = _firestore.collection('users').doc(user.id);
    
    // Use set with merge to avoid overwriting existing data if they log in again
    await userDoc.set({
      'email': user.email,
      'createdAt': FieldValue.serverTimestamp(),
      // Add future fields here (e.g., 'role': 'basic_user')
    }, SetOptions(merge: true)); 
  }

  @override
  Future<AppUser?> fetchUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    
    final data = doc.data()!;
    return AppUser(
      id: uid,
      email: data['email'] as String?,
    );
  }
}