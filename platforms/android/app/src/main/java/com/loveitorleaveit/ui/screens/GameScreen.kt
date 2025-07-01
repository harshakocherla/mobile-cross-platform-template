package com.loveitorleaveit.ui.screens

import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.loveitorleaveit.data.GameState

@Composable
fun GameScreen(
    gameState: GameState,
    onBackToHome: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        gameState.currentPrompt?.let { prompt ->
            Card(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    horizontalAlignment = Alignment.CenterHorizontally
                ) {
                    Text(
                        text = prompt.category.displayName,
                        style = MaterialTheme.typography.bodyMedium
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Text(
                        text = prompt.text,
                        style = MaterialTheme.typography.headlineSmall
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(32.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                Button(
                    onClick = { /* Handle Love It */ }
                ) {
                    Text("Love It")
                }
                
                Button(
                    onClick = { /* Handle Leave It */ }
                ) {
                    Text("Leave It")
                }
            }
        } ?: run {
            Text(
                text = "Game Over!",
                style = MaterialTheme.typography.headlineLarge
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Button(onClick = onBackToHome) {
                Text("Back to Home")
            }
        }
    }
} 