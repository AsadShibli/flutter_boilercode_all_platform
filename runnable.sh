flutter create poker_app

cd poker_app

mkdir -p lib/src/features/authentication/domain && touch lib/src/features/authentication/domain/app_user.dart

touch lib/src/features/authentication/domain/auth_repository.dart

flutter pub add firebase_auth

# Step 1: Install the core Firebase CLI globally
npm install -g firebase-tools

# Step 2: Log into your Google/Firebase account
firebase login

# Step 3: Install the FlutterFire CLI globally
dart pub global activate flutterfire_cli

export PATH="$PATH":"$HOME/.pub-cache/bin"

flutterfire configure


mkdir -p lib/src/features/authentication/data/ && touch lib/src/features/authentication/data/firebase_auth_repository.dart

mkdir -p lib/src/features/authentication/presentation/ && touch lib/src/features/authentication/presentation/auth_screen.dart

touch lib/src/features/authentication/data/auth_providers.dart

mkdir -p lib/src/features/home/presentation/ && touch lib/src/features/home/presentation/home_screen.dart

flutter pub add cloud_firestore

touch lib/src/features/authentication/domain/user_repository.dart

touch lib/src/features/authentication/data/firestore_user_repository.dart
