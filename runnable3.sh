keytool -genkey -v -keystore android/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

touch android/key.properties

cd android
./gradlew signingReport


cd ..
flutter clean
flutter pub get
mv android/upload-keystore.jks android/app/

flutter build appbundle --release