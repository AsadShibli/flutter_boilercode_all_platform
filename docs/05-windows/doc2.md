// this project is for flutter,firebase,fireauth,one feature:auth for web 
//version
1. `flutter run -d web-server` , to check all working or not
2. create code_files_2 folder 
3. for web:
4. modify firebase.json: saved in `code_files_2/4.json`
5. `flutter pub add go_router`
6. update main.dart saved in `code_files_2/6.dart`
7. `mkdir -p lib/src/routing && touch lib/src/routing/go_router_refresh_stream.dart`
    ```
    import 'dart:async';
    import 'package:flutter/foundation.dart';

    /// Converts a Stream into a ChangeNotifier for GoRouter's refreshListenable
    class GoRouterRefreshStream extends ChangeNotifier {
    GoRouterRefreshStream(Stream<dynamic> stream) {
        notifyListeners();
        _subscription = stream.asBroadcastStream().listen(
        (dynamic _) => notifyListeners(),
        );
    }
    late final StreamSubscription<dynamic> _subscription;
    @override
    void dispose() {
        _subscription.cancel();
        super.dispose();
    }
    }
    ```
8. `touch lib/src/routing/app_router.dart` : saved in code_files/8.dart

9. go_router makes all the routing decision now,so `rm lib/src/features/authentication/presentation/auth_screen.dart`

10. Update `lib/src/features/authentication/domain/auth_repository.dart`:
    ```
    // Add this line inside the class
    AppUser? get currentUser;
    ```

11. Update `lib/src/features/authentication/data/firebase_auth_repository.dart`:
    ```
    @override
    AppUser? get currentUser => _mapFirebaseUser(_firebaseAuth.currentUser);
    ```

12. Rename  folder,file from home to dashboard to match the URL routing:
    `mv lib/src/features/home lib/src/features/dashboard`
    `mv lib/src/features/dashboard/presentation/home_screen.dart lib/src/features/dashboard/presentation/dashboard_screen.dart`

    12a. update the class name in `lib/src/features/dashboard/presentation/dashboard_screen.dart`:
        ```
        class DashboardScreen extends ConsumerWidget {
        final String userId;

        const DashboardScreen({super.key, required this.userId});
        ```
13. update main.dart:
    13a. `import 'firebase_options.dart';` at top
    13b. 
        ```
        await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
        );
        ```
14. update lib/src/routing/app_router.dart:
    14a. `import '../features/home/presentation/home_screen.dart'; ` to `import '../features/dashboard/presentation/dashboard_screen.dart';`

    14b. change `return DashboardScreen(userId: userId);` inside routerProvider routes list
15. `flutter run -d web-server`
16. `flutter build web --wasm`
17. `firebase use --add`
17. `firebase deploy --only hosting`