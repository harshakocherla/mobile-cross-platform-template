# Setup Guide

This guide will help you set up the mobile-cross-platform-template monorepo for both iOS and Android development.

## Prerequisites

### For iOS Development
- macOS (required for iOS development)
- Xcode 13.0 or later
- iOS 15.0+ deployment target
- Swift 5.5+

### For Android Development
- Android Studio Arctic Fox or later
- Android SDK (API 21+)
- Java Development Kit (JDK) 8 or later
- Kotlin 1.8.10+

## Repository Structure

```
love-it-or-leave-it/
├── platforms/
│   ├── ios/           # iOS SwiftUI implementation
│   └── android/       # Android Kotlin implementation
├── docs/              # Shared documentation
├── assets/            # Shared assets
│   └── shared/        # Cross-platform assets
└── README.md
```

## Getting Started

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd love-it-or-leave-it
```

### 2. iOS Setup

```bash
cd platforms/ios
open mobile-cross-platform-template.xcodeproj
```

1. Open the project in Xcode
2. Select your target device or simulator
3. Build and run the project (⌘+R)

### 3. Android Setup

```bash
cd platforms/android
./gradlew build
```

1. Open the project in Android Studio
2. Sync Gradle files
3. Build and run the project

## Development Workflow

### Shared Assets
- Place shared assets in `assets/shared/`
- Use the same prompts data (`prompts.json`) for both platforms
- Maintain consistent naming conventions

### Code Organization
- Keep platform-specific code in respective `platforms/` directories
- Share business logic where possible
- Use similar architecture patterns across platforms

### Testing
- Test on both platforms before committing
- Use the same test scenarios for consistency
- Maintain separate test suites for platform-specific features

## Building for Production

### iOS
1. Archive the project in Xcode
2. Upload to App Store Connect
3. Submit for review

### Android
1. Generate signed APK/AAB
2. Upload to Google Play Console
3. Submit for review

## Troubleshooting

### Common iOS Issues
- **Build errors**: Check Xcode version compatibility
- **Simulator issues**: Reset simulator or use different device
- **Dependency issues**: Clean build folder (⌘+Shift+K)

### Common Android Issues
- **Gradle sync failures**: Check JDK version and Android SDK
- **Build errors**: Clean project (`./gradlew clean`)
- **Emulator issues**: Create new AVD or use physical device

## Contributing

1. Create a feature branch
2. Make changes for both platforms
3. Test thoroughly on both iOS and Android
4. Submit a pull request

## Next Steps

- [ ] Implement shared business logic
- [ ] Add comprehensive testing
- [ ] Set up CI/CD pipelines
- [ ] Add analytics and crash reporting
- [ ] Implement user accounts and cloud sync 