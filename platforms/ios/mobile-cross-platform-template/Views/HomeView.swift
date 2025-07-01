//
//  HomeView.swift
//  mobile-cross-platform-template
//
//  Created by Harsha Kocherla on 6/14/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var gameState: GameState
    @State private var showingSettings = false
    @State private var player1Name = ""
    @State private var player2Name = ""
    @State private var selectedGameMode: GameMode = .standard
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Love It or Leave It")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                VStack(spacing: 20) {
                    TextField("Player 1 Name", text: $player1Name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    TextField("Player 2 Name", text: $player2Name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                
                Picker("Game Mode", selection: $selectedGameMode) {
                    Text("Standard").tag(GameMode.standard)
                    Text("Dealbreaker").tag(GameMode.dealbreaker)
                    Text("Rapid Fire").tag(GameMode.rapidFire)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                Button(action: startGame) {
                    Text("Start Game")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(player1Name.isEmpty || player2Name.isEmpty)
                
                Button(action: { showingSettings = true }) {
                    Label("Settings", systemImage: "gear")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                .padding()
            }
            .padding()
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
    
    private func startGame() {
        gameState.player1.name = player1Name
        gameState.player2.name = player2Name
        gameState.gameMode = selectedGameMode
        gameState.startGame()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(GameState())
    }
}

