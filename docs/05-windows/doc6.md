step 0: The Native Infrastructure (The C++ Toolchain)

    Flutter on Windows does not run in a browser; it compiles down to a native Win32/UWP C++ application. You must install the Microsoft compiler.

        Download Visual Studio 2022 (Do not install Visual Studio 2026, as it currently has known toolchain conflicts with the Flutter engine).

        During the installation process, you must check the box for the Desktop development with C++ workload.

        Ensure the Windows 10/11 SDK is checked in the installation details on the right side of the installer.

        Complete the installation and restart your terminal.

1. download flutter sdk for windows:
    Install Flutter with VS Code
    Open the command palette in VS Code.

    Go to View > Command Palette or press Control + Shift + P.

    In the command palette, type flutter.

    Select Flutter: New Project.

    VS Code prompts you to locate the Flutter SDK on your computer. Select Download SDK.

    When the Select Folder for Flutter SDK dialog displays, choose where you want to install Flutter.

    Click Clone Flutter.
    Click Add SDK to PATH.

    When successful, a notification displays:

    The Flutter SDK was added to your PATH
    VS Code might display a Google Analytics notice.

    If you agree, click OK.

    To ensure that Flutter is available in all terminals:

    Close, then reopen all terminal windows.
    Restart VS Code.

2. `flutter pub get`
3.  Instruct the Flutter SDK to unlock the Windows engine
`flutter config --enable-windows-desktop`

4. Inject the native C++ scaffolding into your existing project
    `flutter create --platforms=windows .`
5. Verify the toolchain is recognized (Ensure "Windows" has a green checkmark)
    `flutter doctor`

6. 
    ```
    flutter clean
    flutter pub get
    flutter build windows --release
    ```
7. Add the msix package to your dev dependencies.
    `flutter pub add --dev msix`

8. Open your pubspec.yaml and inject this configuration block at the very bottom. This dictates how Windows registers your application.
    ```
    msix_config:
    display_name: "Poker App"
    publisher_display_name: "Asadullah Shibli"
    identity_name: "com.asadullahshibli.pokerapp"
    msix_version: 1.0.0.0
    logo_path: "C:\Users\user\Desktop\flutter_desktop\flutter_boilercode_all_platform\logo\app.png" # Must be an absolute path
    ```

9. Run the tool to sweep up your .exe, the data/ folder, and all required .dll files into a single, distributable installer.
    `flutter pub run msix:create`

10. You will find a .msix file in your build/windows/x64/runner/Release/ directory.

    You can hand this single file to any Windows user. When they double-click it, they get a professional, native Windows installation prompt. No missing DLL errors. No fragmented folders.
