// this project will try to implement on ios:
if has xcode , but not apple paid developer account , problems will be:

    1. To deploy the app to an iPhone, that specific iPhone must be physically plugged in

    2. The 7-Day Time only

    3. You can only install a maximum of 3 free developer apps on an iPhone at one time.

    4. A free Apple ID restricts you to registering a maximum of 10 unique App IDs within a 7-day period.

    5. Push Notifications or deep linking not possible


1.  Run this exact command in your macOS terminal to accept the Apple Developer license globally and unlock the command-line tools:
    `sudo xcodebuild -license accept`
    Once this executes, launch Xcode manually from the Applications folder just once using the graphical interface. Let it install any remaining "additional components" it asks for. Close it.

2. install brew command : `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

    ```
    echo >> /Users/asad/.zprofile
    echo 'eval "$(/usr/local/bin/brew shellenv zsh)"' >> /Users/asad/.zprofile
    eval "$(/usr/local/bin/brew shellenv zsh)"
    ```
    check installed or not by running this command: `brew --version`
3. install the Flutter command-line tool on a Mac
    - We will pull the archived Flutter 3.3.10 binary directly from Google’s infrastructure, bypassing the package manager completely.
          ```
          mkdir ~/development
            cd ~/development
            curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_3.3.10-stable.zip
          ```
    - Unzip the downloaded archive natively. `unzip flutter_macos_3.3.10-stable.zip`

    - You must tell your zsh shell where this new, manually installed Flutter binary lives so you can execute it from anywhere.
        ```
        echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zprofile
        source ~/.zprofile
        ```
    - `flutter --version` // it should be 3.3.10 which is compatible with my macos version(10.15)
        if it is stuck:
            a. 
                ```
                rm -f ~/development/flutter/bin/cache/flutter_tools.stamp
                rm -f ~/development/flutter/bin/cache/flutter_tools.snapshot
                ```
            b. 
                ```
                export PUB_HOSTED_URL=https://pub.flutter-io.cn
                export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
                ```
            c. finally `flutter --version -v`

4. Run `flutter pub run` to download the Dart packages.
    not possible anymore as the project is written with dart 3 code , but this doesn't support this specific lower flutter version , the catalina(10.15) is the last latest version that doesn't strictly wants gpu , so only way to is to inject physical apple compitable gpu
