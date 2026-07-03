flutter pub add go_router

mkdir -p lib/src/routing && touch lib/src/routing/go_router_refresh_stream.dart

touch lib/src/routing/app_router.dart

rm lib/src/features/authentication/presentation/auth_screen.dart

mv lib/src/features/home lib/src/features/dashboard

mv lib/src/features/dashboard/presentation/home_screen.dart lib/src/features/dashboard/presentation/dashboard_screen.dart

flutter build web --wasm

firebase use --add

firebase deploy --only hosting