// this project is for flutter,firebase,fireauth,one feature:auth
1. create a project in firebase console
2. firebase console setup:
    2a. auth sign in enable
    2b. firestore setup
3. `flutter create poker-app`
4. `cd poker-app`
5. feature-first approach would be to implement the first feature(firebase auth) to all platform
    ```
    lib/
    src/
        features/
        authentication/
            domain/       # Core business logic, models, entities
            data/         # Repositories, API interfaces, local storage
            presentation/ # UI screens, widgets, state controllers
    ```
6. `mkdir -p lib/src/features/authentication/domain && touch lib/src/features/authentication/domain/app_user.dart`
    ```
    class AppUser {
    final String id;
    final String? email;

    const AppUser({required this.id, this.email});
    }
    ```
7. `touch lib/src/features/authentication/domain/auth_repository.dart`
    ```
    abstract class AuthRepository {
    Stream<AppUser?> authStateChanges();
    Future<void> signInWithEmail(String email, String password);
    Future<void> signOut();
    }
    ```
8. 
    ```
    flutter pub add firebase_auth

    # Step 1: Install the core Firebase CLI globally
    npm install -g firebase-tools

    # Step 2: Log into your Google/Firebase account
    firebase login

    # Step 3: Install the FlutterFire CLI globally
    dart pub global activate flutterfire_cli

    export PATH="$PATH":"$HOME/.pub-cache/bin"

    flutterfire configure
    ```
9. `mkdir -p lib/src/features/authentication/data/ && touch lib/src/features/authentication/data/firebase_auth_repository.dart`
    9a. saved in code_files/9a.dart
11. `flutter pub add flutter_riverpod`
12. saved modified main.dart in code_files/12.dart
13. `touch lib/src/features/authentication/data/auth_providers.dart`
    13a. saved in code_files/13a.dart
14. `mkdir -p lib/src/features/authentication/presentation/ && touch lib/src/features/authentication/presentation/auth_screen.dart`
    14a. saved in code_files/14a.dart
15. Create a new feature folder. For now, we will call it home
    ```
    lib/
    src/
        features/
        authentication/    # We are done here for now
        home/              # NEW DOMAIN
            presentation/
            home_screen.dart
    ```
16. `mkdir -p lib/src/features/home/presentation/ && touch lib/src/features/home/presentation/home_screen.dart`
    16a. saved in code_files/16a.dart
17. `flutter pub add cloud_firestore`
18. `touch lib/src/features/authentication/domain/user_repository.dart`
    ```
    import 'app_user.dart';

    abstract class UserRepository {
    Future<void> createUserDocument(AppUser user);
    Future<AppUser?> fetchUserData(String uid);
    }
    ```
19. `touch lib/src/features/authentication/data/firestore_user_repository.dart`
    19a. saved in code_files/19a.dart
20. `flutter run` to check all working or not before deploying to cross platform
