package com.example.esewasub

import android.content.Context
import java.security.MessageDigest
import java.util.UUID

object AuthManager {
    private const val PREFS_USERS = "auth_users"
    private const val ACTIVE_USER = "active_user_id"

    fun register(context: Context, id: String, pass: String): Boolean {
        val prefs = SecurityProvider.getEncryptedPrefs(context)
        if (prefs.contains("user_$id")) return false // user already exists

        val hashedPass = hashPassword(pass)
        val uuid = UUID.randomUUID().toString()
        
        prefs.edit()
            .putString("user_$id", hashedPass)
            .putString("uuid_$id", uuid)
            .apply()
        
        return true
    }

    fun login(context: Context, id: String, pass: String): String? {
        val prefs = SecurityProvider.getEncryptedPrefs(context)
        val storedHash = prefs.getString("user_$id", null) ?: return null
        
        if (hashPassword(pass) == storedHash) {
            val uuid = prefs.getString("uuid_$id", null) ?: UUID.randomUUID().toString()
            
            prefs.edit().putString(ACTIVE_USER, id).apply()
            prefs.edit().putString("uuid", uuid).apply() // current session uuid
            
            /*
         
            context.getSharedPreferences("session", Context.MODE_PRIVATE)
                .edit().putString("uid", uuid).apply()
            */
            
            return uuid
        }
        return null
    }

    fun getActiveUser(context: Context): String? {
        return SecurityProvider.getEncryptedPrefs(context).getString(ACTIVE_USER, null)
    }

    fun logout(context: Context) {
        SecurityProvider.getEncryptedPrefs(context)
            .edit()
            .remove(ACTIVE_USER)
            .remove("uuid")
            .apply()
    }

    private fun hashPassword(password: String): String {
        val bytes = password.toByteArray()
        val md = MessageDigest.getInstance("SHA-256")
        val digest = md.digest(bytes)
        return digest.fold("") { str, it -> str + "%02x".format(it) }
    }
}
