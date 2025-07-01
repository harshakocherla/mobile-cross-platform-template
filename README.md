# Love It or Leave It

A fun and engaging mobile game for couples to better understand each other's preferences, turn-ons/turn-offs, and opinions through an interactive card game.

## 🏗️ Project Structure

This is a monorepo containing both iOS and Android implementations:

```
love-it-or-leave-it/
├── platforms/
│   ├── ios/           # iOS SwiftUI implementation
│   └── android/       # Android Kotlin implementation
├── docs/              # Shared documentation
├── assets/            # Shared assets (icons, images)
└── README.md
```

## 🎮 Features

- Interactive card game interface
- Multiple categories of prompts (Food & Drink, Travel & Adventure, Social & Lifestyle, etc.)
- Beautiful animations and transitions
- Score tracking
- Custom prompt creation
- Game variations (Standard, Dealbreaker, Rapid Fire)

## 📱 Platform Support

### iOS
- **Requirements**: iOS 15.0+, Xcode 13.0+, Swift 5.5+
- **Location**: `platforms/ios/`
- **Framework**: SwiftUI

### Android
- **Requirements**: Android API 21+, Android Studio Arctic Fox+
- **Location**: `platforms/android/`
- **Language**: Kotlin
- **Framework**: Jetpack Compose

## 🚀 Getting Started

### iOS Development
1. Navigate to the iOS project: `cd platforms/ios/`
2. Open `mobile-cross-platform-template.xcodeproj` in Xcode
3. Build and run the project

### Android Development
1. Navigate to the Android project: `cd platforms/android/`
2. Open the project in Android Studio
3. Sync Gradle and run the app

## 🎯 Game Modes

1. **Standard Mode**: Take turns revealing prompts and see if you both love it or leave it
2. **Dealbreaker Mode**: Focus on important relationship topics
3. **Rapid Fire Mode**: Quick-fire questions with a timer

## 📋 Development Roadmap

- [x] iOS SwiftUI Implementation
- [ ] Android Kotlin Implementation
- [ ] Shared Business Logic
- [ ] Cross-platform Testing
- [ ] App Store & Play Store Deployment
- [ ] Analytics & Crash Reporting
- [ ] Push Notifications
- [ ] Social Features

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on both platforms
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For questions or support, please open an issue on GitHub. 