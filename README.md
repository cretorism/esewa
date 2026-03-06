# eSewa Hybrid Project

A high-performance hybrid mobile application demonstrating the integration of native Android (Kotlin) and iOS (Swift) with a shared Flutter module. Sensitive logic such as authentication and session management remains native, while complex UI components like product lists and details are shared via Flutter.

## Key Requirements & Implementation

### 1. Native Platform Support
- **Android**: Developed using Kotlin (Target SDK 35).
- **iOS**: Developed using Swift and SwiftUI.
- **Solution**: Native wrappers pre-warm the Flutter engine for near-instant transitions.

### 2. Dynamic Theming
- **Requirement**: Pass theme tokens (Light/Dark mode, Colors, Spacing, Typography) from native to Flutter at runtime.
- **Solution**: The native host builds a configuration JSON and passes it to Flutter during module initialization. Flutter uses Riverpod to manage this global state.

### 3. Session & Security
- **Requirement**: Generate and cache a random UUID upon login; bypass login if cached. Use UUID in all API headers.
- **Solution**:
    - **Android**: Uses `EncryptedSharedPreferences` for secure storage.
    - **iOS**: Uses the system Keychain via a `KeychainHelper`.
    - **Headers**: A Dio interceptor in the Flutter module automatically attaches the `X-Session-UUID` to all network requests.

### 4. Hybrid Navigation
- **Requirement**: seamlessly transition between native views and shared Flutter screens.
- **Solution**: Custom MethodChannels (`com.app.native/flutter`) handle communication, allowing Flutter to trigger native actions like payment processing or logout.

### 5. Shared Product Module
- **Requirement**: Shared UI for product catalogs and details using fakeStoreApi.
- **Solution**: Implemented with Riverpod for state management and Dio for network requests with offline caching capabilities.

## Getting Started

### 1. Clone the Repository
```bash
git clone <repository-url>
cd esewa
```

### 2. Prepare Flutter Module
```bash
cd flutter_product_module
flutter clean
flutter pub get
cd ..
```

### 3. Run the Application

#### Android
```bash
cd esewasub
./gradlew installDebug
```

#### iOS
1. Ensure the Flutter module is prepared (Step 2).
2. Install CocoaPods:
```bash
cd subios/subios
pod install
```
3. Open `subios.xcworkspace` in Xcode.
4. Select a simulator or device and click **Run**.

---

## Technical Stack
- **Native**: Kotlin (Compose), Swift (SwiftUI)
- **Flutter**: Riverpod, Dio, Freezed
- **Security**: AES-256 (Android), Keychain (iOS), SHA-256 Hashing
