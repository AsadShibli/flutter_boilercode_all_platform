import 'app_user.dart';

abstract class UserRepository {
  Future<void> createUserDocument(AppUser user);
  Future<AppUser?> fetchUserData(String uid);
}