package com.loveitorleaveit.data

import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.State
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue

enum class GameMode {
    STANDARD,
    DEALBREAKER,
    RAPID_FIRE
}

enum class PromptCategory(val displayName: String, val icon: String) {
    FOOD("Food & Drink", "🍽️"),
    TRAVEL("Travel & Adventure", "✈️"),
    SOCIAL("Social & Lifestyle", "🎉"),
    ROMANCE("Romance & Intimacy", "💖"),
    ENTERTAINMENT("Entertainment & Hobbies", "🎧"),
    VALUES("Values & Deep Talk", "🧠")
}

data class Prompt(
    val id: String,
    val text: String,
    val category: PromptCategory,
    val isCustom: Boolean = false
)

data class Player(
    var name: String,
    var score: Int = 0,
    var correctGuesses: Int = 0
)

class GameState {
    var currentPrompt: Prompt? by mutableStateOf(null)
        private set
    
    var player1: Player by mutableStateOf(Player("Player 1"))
        private set
    
    var player2: Player by mutableStateOf(Player("Player 2"))
        private set
    
    var gameMode: GameMode by mutableStateOf(GameMode.STANDARD)
        private set
    
    var remainingPrompts: List<Prompt> by mutableStateOf(emptyList())
        private set
    
    var isGameActive: Boolean by mutableStateOf(false)
        private set
    
    var showResults: Boolean by mutableStateOf(false)
        private set
    
    var timeRemaining: Int? by mutableStateOf(null)
        private set

    init {
        loadSamplePrompts()
    }

    fun startGame() {
        isGameActive = true
        drawNextPrompt()
    }

    fun drawNextPrompt() {
        if (remainingPrompts.isEmpty()) {
            endGame()
            return
        }
        
        currentPrompt = remainingPrompts.first()
        remainingPrompts = remainingPrompts.drop(1)
        showResults = false
    }

    fun submitAnswers(player1Choice: Boolean, player2Choice: Boolean) {
        if (player1Choice == player2Choice) {
            player1 = player1.copy(score = player1.score + 1)
            player2 = player2.copy(score = player2.score + 1)
        }
        
        showResults = true
        
        if (gameMode == GameMode.RAPID_FIRE) {
            // Auto-advance after delay
        }
    }

    fun endGame() {
        isGameActive = false
        currentPrompt = null
    }

    fun resetGame() {
        player1 = Player(player1.name)
        player2 = Player(player2.name)
        remainingPrompts = samplePrompts.shuffled()
        isGameActive = false
        showResults = false
        timeRemaining = if (gameMode == GameMode.RAPID_FIRE) 120 else null
    }

    fun updatePlayerNames(name1: String, name2: String) {
        player1 = player1.copy(name = name1)
        player2 = player2.copy(name = name2)
    }

    fun updateGameMode(mode: GameMode) {
        gameMode = mode
        timeRemaining = if (mode == GameMode.RAPID_FIRE) 120 else null
    }

    private fun loadSamplePrompts() {
        remainingPrompts = samplePrompts.shuffled()
    }

    companion object {
        private val samplePrompts = listOf(
            Prompt("food-1", "Pineapple on pizza", PromptCategory.FOOD),
            Prompt("food-2", "Sushi", PromptCategory.FOOD),
            Prompt("food-3", "Coffee", PromptCategory.FOOD),
            Prompt("food-4", "Spicy food", PromptCategory.FOOD),
            Prompt("travel-1", "Camping", PromptCategory.TRAVEL),
            Prompt("travel-2", "Cruise vacations", PromptCategory.TRAVEL),
            Prompt("travel-3", "Road trips", PromptCategory.TRAVEL),
            Prompt("travel-4", "Solo travel", PromptCategory.TRAVEL),
            Prompt("social-1", "Social media", PromptCategory.SOCIAL),
            Prompt("social-2", "Nightclubs", PromptCategory.SOCIAL),
            Prompt("social-3", "Small talk", PromptCategory.SOCIAL),
            Prompt("social-4", "Group activities", PromptCategory.SOCIAL),
            Prompt("romance-1", "Public displays of affection", PromptCategory.ROMANCE),
            Prompt("romance-2", "Long-distance relationships", PromptCategory.ROMANCE),
            Prompt("romance-3", "Marriage", PromptCategory.ROMANCE),
            Prompt("romance-4", "Dating apps", PromptCategory.ROMANCE),
            Prompt("entertainment-1", "Reality TV", PromptCategory.ENTERTAINMENT),
            Prompt("entertainment-2", "Video games", PromptCategory.ENTERTAINMENT),
            Prompt("entertainment-3", "Reading", PromptCategory.ENTERTAINMENT),
            Prompt("entertainment-4", "Dancing", PromptCategory.ENTERTAINMENT),
            Prompt("values-1", "Religion", PromptCategory.VALUES),
            Prompt("values-2", "Politics", PromptCategory.VALUES),
            Prompt("values-3", "Career vs. family", PromptCategory.VALUES),
            Prompt("values-4", "Money management", PromptCategory.VALUES)
        )
    }
} 