package com.loveitorleaveit

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.loveitorleaveit.data.GameState
import com.loveitorleaveit.ui.screens.GameScreen
import com.loveitorleaveit.ui.screens.HomeScreen
import com.loveitorleaveit.ui.screens.OnboardingScreen
import com.loveitorleaveit.ui.theme.MobileCrossPlatformTemplateTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MobileCrossPlatformTemplateTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    MobileCrossPlatformTemplateApp()
                }
            }
        }
    }
}

@Composable
fun MobileCrossPlatformTemplateApp() {
    val navController = rememberNavController()
    val gameState = GameState()

    NavHost(navController = navController, startDestination = "onboarding") {
        composable("onboarding") {
            OnboardingScreen(
                onComplete = {
                    navController.navigate("home") {
                        popUpTo("onboarding") { inclusive = true }
                    }
                }
            )
        }
        composable("home") {
            HomeScreen(
                gameState = gameState,
                onStartGame = {
                    navController.navigate("game")
                }
            )
        }
        composable("game") {
            GameScreen(
                gameState = gameState,
                onBackToHome = {
                    navController.navigate("home") {
                        popUpTo("game") { inclusive = true }
                    }
                }
            )
        }
    }
} 