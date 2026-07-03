import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/authentication/data/auth_providers.dart';
import '../features/authentication/presentation/login_screen.dart';
import '../features/dashboard/presentation/dashboard_screen.dart';
import 'go_router_refresh_stream.dart';

final routerProvider = Provider<GoRouter>((ref) {
  // We read the repository to access the raw authentication stream
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    // Inject our stream bridge. GoRouter will now re-evaluate its redirect logic
    // every time the Firebase Auth state emits a new value.
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    
    // The Gatekeeper Logic
    redirect: (context, state) {
      // Check the synchronous state of the user via Firebase
      // Note: For more complex states, you can read the Provider's current value
      final isAuthenticated = authRepository.currentUser != null; 
      final isNavigatingToLogin = state.uri.path == '/login';

      if (!isAuthenticated && !isNavigatingToLogin) {
        // Force unauthenticated users to the gateway
        return '/login';
      }

      if (isAuthenticated && isNavigatingToLogin) {
        // Prevent authenticated users from seeing the login screen
        return '/dashboard';
      }

      return null; // No redirect needed, proceed to the requested route
    },
    
    // The Route Taxonomy
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) {
          // Extract the user ID synchronously for the dashboard
          final userId = authRepository.currentUser?.id ?? 'unknown';
          return DashboardScreen(userId: userId);
        },
      ),
      // Add future routes here (e.g., '/profile', '/settings')
    ],
  );
});