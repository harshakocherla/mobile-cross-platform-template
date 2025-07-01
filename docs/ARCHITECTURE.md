# Architecture Documentation

## Overview

This document describes the architecture for the Love It or Leave It game across both iOS and Android platforms.

## Core Components

### 1. Game State Management
Both platforms implement the same game state structure:

```kotlin
// Android (Kotlin)
data class GameState(
    val currentPrompt: Prompt?,
    val player1: Player,
    val player2: Player,
    val gameMode: GameMode,
    val remainingPrompts: List<Prompt>,
    val isGameActive: Boolean,
    val showResults: Boolean,
    val timeRemaining: Int?
)
```

```swift
// iOS (Swift)
class GameState: ObservableObject {
    @Published var currentPrompt: Prompt?
    @Published var player1: Player
    @Published var player2: Player
    @Published var gameMode: GameMode
    @Published var remainingPrompts: [Prompt]
    @Published var isGameActive: Bool
    @Published var showResults: Bool
    @Published var timeRemaining: Int?
}
```

### 2. Data Models

#### Prompt
- `id`: Unique identifier
- `text`: The prompt/question text
- `category`: Category (Food, Travel, Social, etc.)
- `isCustom`: Whether it's a user-created prompt

#### Player
- `name`: Player's name
- `score`: Current score
- `correctGuesses`: Number of correct predictions

#### GameMode
- `Standard`: Normal gameplay
- `Dealbreaker`: Focus on important topics
- `RapidFire`: Timed gameplay

## UI Architecture

### iOS (SwiftUI)
- **ContentView**: Root view with navigation
- **OnboardingView**: Introduction screens
- **HomeView**: Game setup and player names
- **GameView**: Main gameplay interface
- **SettingsView**: App configuration

### Android (Jetpack Compose)
- **MainActivity**: Entry point
- **OnboardingScreen**: Introduction screens
- **HomeScreen**: Game setup and player names
- **GameScreen**: Main gameplay interface
- **SettingsScreen**: App configuration

## Navigation Flow

```
Onboarding → Home → Game → Results → Home
                ↓
            Settings
```

## Shared Assets

- App icons (iOS and Android specific sizes)
- Launch screens
- Game prompts (JSON format)
- Sound effects
- Animations

## Future Enhancements

1. **Shared Business Logic**: Extract common game logic into a shared module
2. **Cross-platform Testing**: Unified test suite
3. **Analytics**: Shared analytics implementation
4. **Backend Integration**: User accounts and cloud sync 