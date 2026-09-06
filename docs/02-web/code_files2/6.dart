import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
// Import this specific package to control the URL strategy
import 'package:flutter_web_plugins/url_strategy.dart'; 
import 'src/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // This single line eradicates the '#' from your web URLs
  usePathUrlStrategy(); 
  
  await Firebase.initializeApp();
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Convert MyApp to a ConsumerWidget to read the router provider
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router configuration
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Platform Architecture',
      routerConfig: goRouter,
    );
  }
}