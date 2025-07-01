import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameState: GameState
    @State private var player1Choice: Bool?
    @State private var player2Choice: Bool?
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                if let prompt = gameState.currentPrompt {
                    // Prompt Card
                    VStack(spacing: 15) {
                        Text(prompt.category.rawValue)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text(prompt.text)
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding()
                    
                    // Player Choices
                    HStack(spacing: 20) {
                        PlayerChoiceView(
                            playerName: gameState.player1.name,
                            choice: $player1Choice,
                            isEnabled: player2Choice == nil
                        )
                        
                        PlayerChoiceView(
                            playerName: gameState.player2.name,
                            choice: $player2Choice,
                            isEnabled: player1Choice == nil
                        )
                    }
                    .padding()
                    
                    // Results or Next Button
                    if gameState.showResults {
                        ResultsView(
                            player1Choice: player1Choice ?? false,
                            player2Choice: player2Choice ?? false
                        )
                        .transition(.opacity)
                    }
                    
                    if player1Choice != nil && player2Choice != nil && !gameState.showResults {
                        Button(action: submitAnswers) {
                            Text("Reveal Results")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                } else {
                    Text("Game Over!")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Button(action: { gameState.isGameActive = false }) {
                        Text("Return to Home")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
        }
    }
    
    private func submitAnswers() {
        guard let choice1 = player1Choice, let choice2 = player2Choice else { return }
        gameState.submitAnswers(player1Choice: choice1, player2Choice: choice2)
        
        // Reset choices for next round
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            player1Choice = nil
            player2Choice = nil
            gameState.drawNextPrompt()
        }
    }
}

struct PlayerChoiceView: View {
    let playerName: String
    @Binding var choice: Bool?
    let isEnabled: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text(playerName)
                .font(.headline)
            
            HStack(spacing: 20) {
                Button(action: { choice = true }) {
                    Text("Love It")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(choice == true ? Color.green : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(!isEnabled)
                
                Button(action: { choice = false }) {
                    Text("Leave It")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(choice == false ? Color.red : Color.gray)
                        .cornerRadius(10)
                }
                .disabled(!isEnabled)
            }
        }
    }
}

struct ResultsView: View {
    let player1Choice: Bool
    let player2Choice: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Results")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack(spacing: 20) {
                ResultIndicator(choice: player1Choice)
                ResultIndicator(choice: player2Choice)
            }
            
            if player1Choice == player2Choice {
                Text("Match! +1 point each")
                    .font(.headline)
                    .foregroundColor(.green)
            } else {
                Text("No match")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

struct ResultIndicator: View {
    let choice: Bool
    
    var body: some View {
        Image(systemName: choice ? "heart.fill" : "xmark.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(choice ? .green : .red)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameState())
    }
} 