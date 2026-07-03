// this project is for flutter,firebase,fireauth,one feature:auth for web 
//version
1. `flutter run -d web-server` , to check all working or not
2. create code_files_2 folder 
3. for andriod:
4. Cryptographic Identity (The Keystore) stored in this specific project directory: `keytool -genkey -v -keystore android/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload`
5. `touch android/key.properties`
    ```
    storePassword=asad123
    keyPassword=asad123
    keyAlias=upload
    storeFile=upload-keystore.jks
    ```
6. add those to .gitignore:
    ```
    # Android Keys tore Security
    android/key.properties
    *.jks
    *.keystore
    ```
10. update android/app/build.gradle.kts: 
        10a . applicationID and namespace change to 'com.asadullahshibli.pokerapp'
        saved in code_files3/10.md
11. Update MainActivity.kt (The Native Entry Point):
    11a.Identify the Active Native Layer

        1..Open your code editor and drill down into both folders until you reach the end of the line (com/example/poker_app/).

            i. Look inside the kotlin path: Is MainActivity.kt sitting there? If yes, Kotlin is your native engine.

            ii. Look inside the java path: Is MainActivity.java sitting there? If yes, Java is your native engine.

    11b. Execute the Refactor on the True Path

        Whichever folder contains the actual MainActivity file is the only path you care about.

        If it is in the kotlin folder (which is standard for modern Flutter):

            a. Navigate down the kotlin tree: android/app/src/main/kotlin/com/

            Rename the example folder to asadullahshibli.

            Rename the poker_app folder to pokerapp.

            Open the MainActivity.kt file inside it and change line 1 to: package com.asadullahshibli.pokerapp    
12. Extract the Cryptographic Fingerprints for Firebase:
    Firebase needs to know the exact signature of the app you just configured. Run this in your terminal from the root of your Flutter project:
    `cd android`
    `./gradlew signingReport`
13. Lock the Firebase Console:

    13a.Go to your Firebase Project Console in your browser.

    13b.remove the general andriod app
    
    13c. Click "Add App" -> Select the Android icon.

    13d. In the "Android package name" field, you must paste exactly: com.asadullahshibli.pokerapp.(eariler it was com.example.pokerapp, google rejects this type of name)

    13e. Register the app.

    13f. Look for the output labeled Variant: release. Copy the SHA1 and SHA-256 keys. Paste these directly into your Firebase Console -> Project Settings -> Android App.

    13f. Download the newly generated google-services.json file.

    11g. Drag that file into your project at android/app/google-services.json. (If there is an old one there, overwrite it). saved in code_files/11g.json
    
14.
    ```
    cd ..
    flutter clean
    flutter pub get
    mv android/upload-keystore.jks android/app/
    ```
15. Install the NDK Toolchain:
    15a. Open Android Studio.

    15b. Click More Actions (or the three dots) on the welcome screen and select SDK Manager (or go to Tools -> SDK Manager if a project is open).

    15c. Select the SDK Tools tab.

    15d. Check the box for NDK (Side by side).

    15e. Check the box for CMake (often required alongside the NDK).

    15g. Click Apply and wait for the gigabytes of native C++ toolchains to download and install.
16. Go to your android/app/build.gradle.kts file and explicitly dictate the version right below your compileSdk. for example:`ndkVersion =  "28.2.13676358` 

17. The Hardcoded Path Mapping:(map this ndkversion to your specific project:)

    17a. Open android/local.properties.add this line: `ndk.dir=/home/asad/Android/Sdk/ndk/28.2.13676358`

    17b. `flutter doctor -v` :Look strictly at the [✓] Android toolchain section. If it throws a warning about the NDK being missing or corrupted, the system is still misaligned.
18. Install cmdline-tools if missing in flutter doctor:
    
    18a. Open Android Studio.

    18b. Navigate to SDK Manager (under Tools or the three dots menu).

    18c. Click the SDK Tools tab.

    18d. Show Package Details (bottom-right checkbox).

    18e. Locate Android SDK Command-line Tools (latest).

    18f. Check the box and click Apply. This will install the necessary binaries in your SDK folder.
    18g.Accept the SDK Licenses:

    Once the installation finishes, the terminal needs to officially "sign" the license agreements that Google requires before it allows any compilation.

    Execute this in your terminal: `flutter doctor --android-licenses`

    18h. Verify the Toolchain:

    After accepting the licenses, run the check again to confirm the environment is healthy:
    `flutter doctor`
19. `flutter clean`
20. `flutter pub get`
21. `flutter build appbundle --release` // this will download the app-bundle for play store
22. `flutter build apk --release` // to test locally on device