//
//  GameState.swift
//  mobile-cross-platform-template
//
//  Created by Harsha Kocherla on 6/14/25.
//

import Foundation
import SwiftUI

enum GameMode: String, Codable {
    case standard = "Standard"
    case dealbreaker = "Dealbreaker or Not"
    case rapidFire = "Rapid Fire"
}

struct Player: Codable {
    var name: String
    var score: Int
    var correctGuesses: Int
    
    init(name: String, score: Int, correctGuesses: Int) {
        self.name = name
        self.score = score
        self.correctGuesses = correctGuesses
    }
}

class GameState: ObservableObject {
    @Published var currentPrompt: Prompt?
    @Published var player1: Player
    @Published var player2: Player
    @Published var gameMode: GameMode
    @Published var remainingPrompts: [Prompt]
    @Published var isGameActive: Bool
    @Published var showResults: Bool
    @Published var timeRemaining: Int? // For rapid fire mode
    
    init(player1Name: String = "Player 1", player2Name: String = "Player 2", gameMode: GameMode = .standard) {
        self.player1 = Player(name: player1Name, score: 0, correctGuesses: 0)
        self.player2 = Player(name: player2Name, score: 0, correctGuesses: 0)
        self.gameMode = gameMode
        self.remainingPrompts = Prompt.samplePrompts.shuffled()
        self.isGameActive = false
        self.showResults = false
        self.timeRemaining = gameMode == .rapidFire ? 120 : nil // 2 minutes for rapid fire
    }
    
    func startGame() {
        isGameActive = true
        drawNextPrompt()
    }
    
    func drawNextPrompt() {
        guard !remainingPrompts.isEmpty else {
            endGame()
            return
        }
        
        currentPrompt = remainingPrompts.removeFirst()
        showResults = false
    }
    
    func submitAnswers(player1Choice: Bool, player2Choice: Bool) {
        // Update scores based on matching answers
        if player1Choice == player2Choice {
            player1.score += 1
            player2.score += 1
        }
        
        showResults = true
        
        // For rapid fire mode, automatically move to next prompt after a short delay
        if gameMode == .rapidFire {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.drawNextPrompt()
            }
        }
    }
    
    func endGame() {
        isGameActive = false
        currentPrompt = nil
    }
    
    func resetGame() {
        player1.score = 0
        player2.score = 0
        player1.correctGuesses = 0
        player2.correctGuesses = 0
        remainingPrompts = Prompt.samplePrompts.shuffled()
        isGameActive = false
        showResults = false
        timeRemaining = gameMode == .rapidFire ? 120 : nil
    }
}

