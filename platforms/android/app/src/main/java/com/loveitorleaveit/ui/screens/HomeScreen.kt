package com.loveitorleaveit.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.loveitorleaveit.data.GameState
import com.loveitorleaveit.data.GameMode

@Composable
fun HomeScreen(
    gameState: GameState,
    onStartGame: () -> Unit
) {
    var player1Name by remember { mutableStateOf("") }
    var player2Name by remember { mutableStateOf("") }
    var selectedGameMode by remember { mutableStateOf(GameMode.STANDARD) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Text(
            text = "Love It or Leave It",
            style = MaterialTheme.typography.headlineLarge
        )
        
        Spacer(modifier = Modifier.height(32.dp))
        
        OutlinedTextField(
            value = player1Name,
            onValueChange = { player1Name = it },
            label = { Text("Player 1 Name") },
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        OutlinedTextField(
            value = player2Name,
            onValueChange = { player2Name = it },
            label = { Text("Player 2 Name") },
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(32.dp))
        
        Button(
            onClick = {
                gameState.updatePlayerNames(player1Name, player2Name)
                gameState.updateGameMode(selectedGameMode)
                onStartGame()
            },
            modifier = Modifier.fillMaxWidth(),
            enabled = player1Name.isNotBlank() && player2Name.isNotBlank()
        ) {
            Text("Start Game")
        }
    }
} 