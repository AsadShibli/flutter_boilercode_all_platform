import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/data/auth_providers.dart'; 

class DashboardScreen extends ConsumerWidget {
  final String userId;

  // The userId is injected directly by the AuthWrapper
  const DashboardScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Primary Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Execute the sign-out contract.
              // You do NOT need to write routing code here. 
              // Riverpod's authStateProvider will detect the state change
              // and AuthWrapper will automatically rebuild and route to LoginScreen.
              await ref.read(authRepositoryProvider).signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Authentication Successful.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Active User ID: $userId'),
          ],
        ),
      ),
    );
  }
}