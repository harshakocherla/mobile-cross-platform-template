//
//  ContentView.swift
//  mobile-cross-platform-template
//
//  Created by Harsha Kocherla on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameState = GameState()
    @State private var showingOnboarding = true
    
    var body: some View {
        NavigationView {
            if showingOnboarding {
                OnboardingView(showingOnboarding: $showingOnboarding)
            } else {
                if gameState.isGameActive {
                    GameView()
                } else {
                    HomeView()
                }
            }
        }
        .environmentObject(gameState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
