import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Data Layer: The provider that exposes the authentication stream
import '../data/auth_providers.dart';

// 2. Presentation Layer: Local routing
import 'login_screen.dart';

// 3. Cross-Domain Routing: Escaping the Auth feature
import '../../home/presentation/home_screen.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the authentication state stream.
    // Riverpod's AsyncValue forces the UI to handle loading, error, and data states mathematically.
    final authState = ref.watch(authStateProvider);

    return authState.when(
      data: (user) {
        // State 1: Stream has data. Evaluate if the user entity exists.
        if (user != null) {
          // Route to the authenticated application
          return HomeScreen(userId: user.id); 
        }
        // Route to the unauthenticated login flow
        return const LoginScreen(); 
      },
      loading: () => const Scaffold(
        // State 2: Stream is initializing. 
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Scaffold(
        // State 3: Stream encountered a fatal exception.
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Authentication System Failure:\n$error',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}