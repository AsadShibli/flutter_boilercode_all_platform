// this project will implement PWA 
diff between just web address shortcut vs PWA :
1. The Sandbox (UI)

    Web Shortcut: The app opens inside standard Safari. The user sees a bulky URL search bar at the top and Safari's navigation controls (back/forward/bookmarks) at the bottom. The illusion of a native app is instantly broken.

    PWA: The app opens in its own isolated, full-screen sandbox. The URL bar and navigation buttons are completely stripped away. The UI stretches to the edges of the screen, just like a native app downloaded from the App Store.

2. The App Switcher State

    Web Shortcut: It functions as just another Safari tab. If the user swipes up to view their open apps, your app is buried inside the Safari card. If they close Safari, your app closes.

    PWA: iOS treats the PWA as an independent software entity. In the iOS app switcher, your app has its own dedicated card, isolated from Safari, displaying your custom icon and title.

3. Offline Survivability

    Web Shortcut: If the user opens the app while on a subway or a plane with no signal, Safari attempts to load the URL, fails, and displays the standard "You are not connected to the internet" error page.

    PWA: Because the PWA utilizes a Service Worker (configured in manifest.json), the core application engine and UI assets are aggressively cached on the device. If the user opens it with zero signal, the app launches instantly. (The data fetching will fail, but the UI itself will load and gracefully tell the user they are offline).

4. Push Notifications (The iOS 16.4 Pivot)

    Web Shortcut: Web shortcuts cannot receive push notifications on iOS.

    PWA: As of iOS 16.4 (March 2023), Apple finally unlocked the Web Push API for iOS, but with one massive caveat: It only works if the app is a properly configured PWA added to the home screen. Once installed, your PWA can request permission and send native push notifications that appear on the iPhone lock screen, complete with notification badges on your app icon.  