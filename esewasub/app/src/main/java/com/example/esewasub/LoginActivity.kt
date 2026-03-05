package com.example.esewasub

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Brightness4
import androidx.compose.material.icons.filled.Brightness7
import androidx.compose.ui.res.painterResource
import com.example.esewasub.ui.theme.EsewasubTheme
import java.util.UUID

class LoginActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Auto-login check
        if (AuthManager.getActiveUser(this) != null) {
            startActivity(MainActivity.createIntent(this))
            finish()
            return
        }

        setContent {
            val prefs = remember { SecurityProvider.getEncryptedPrefs(this) }
            var isDarkTheme by remember { 
                mutableStateOf(prefs.getString("theme_mode", "light") == "dark") 
            }
            var isRegisterMode by remember { mutableStateOf(false) }

            EsewasubTheme(darkTheme = isDarkTheme) {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    LoginScreen(
                        isDarkTheme = isDarkTheme,
                        isRegisterMode = isRegisterMode,
                        onThemeToggle = { 
                            isDarkTheme = !isDarkTheme
                            prefs.edit().putString("theme_mode", if (isDarkTheme) "dark" else "light").apply()
                            (application as? App)?.refreshConfig()
                        },
                        onToggleMode = { isRegisterMode = !isRegisterMode },
                        onLoginSuccess = { id, pass -> 
                            if (isRegisterMode) {
                                if (AuthManager.register(this, id, pass)) {
                                    performLogin(id, pass)
                                } else {
                                    "User already exists"
                                }
                            } else {
                                performLogin(id, pass)
                            }
                        }
                    )
                }
            }
        }
    }

    private fun performLogin(id: String, pass: String): String? {
        val uuid = AuthManager.login(this, id, pass)
        if (uuid != null) {
            (application as? App)?.refreshConfig()
            startActivity(MainActivity.createIntent(this))
            finish()
            return null
        }
        return "Invalid ID or Password"
    }
}

@Composable
fun LoginScreen(
    isDarkTheme: Boolean,
    isRegisterMode: Boolean,
    onThemeToggle: () -> Unit,
    onToggleMode: () -> Unit,
    onLoginSuccess: (String, String) -> String?
) {
    var username by remember { mutableStateOf("") }
    var password by remember { mutableStateOf("") }
    var error by remember { mutableStateOf<String?>(null) }

    Box(modifier = Modifier.fillMaxSize()) {
        IconButton(
            onClick = onThemeToggle,
            modifier = Modifier
                .align(Alignment.TopEnd)
                .padding(16.dp)
        ) {
            Icon(
                imageVector = if (isDarkTheme) Icons.Default.Brightness7 else Icons.Default.Brightness4,
                contentDescription = "Toggle Theme"
            )
        }

        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Text(
                if (isRegisterMode) "Create Account" else "Login",
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(32.dp))

            OutlinedTextField(
                value = username,
                onValueChange = { username = it },
                label = { Text("Account ID") },
                modifier = Modifier.fillMaxWidth()
            )
            Spacer(modifier = Modifier.height(16.dp))

            OutlinedTextField(
                value = password,
                onValueChange = { password = it },
                label = { Text("Password") },
                visualTransformation = PasswordVisualTransformation(),
                modifier = Modifier.fillMaxWidth()
            )

            if (error != null) {
                Text(
                    error!!,
                    color = MaterialTheme.colorScheme.error,
                    modifier = Modifier.padding(top = 8.dp)
                )
            }

            Spacer(modifier = Modifier.height(32.dp))

            Button(
                onClick = {
                    if (username.isEmpty() || password.isEmpty()) {
                        error = "Fields cannot be empty"
                    } else {
                        error = onLoginSuccess(username, password)
                    }
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Text(if (isRegisterMode) "Register" else "Login")
            }
            
            TextButton(onClick = onToggleMode) {
                Text(if (isRegisterMode) "Already have an account? Login" else "New here? Create account")
            }
        }
    }
}
