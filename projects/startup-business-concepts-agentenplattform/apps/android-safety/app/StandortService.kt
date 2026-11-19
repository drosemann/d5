// Paket: de.agentenplattform.safety – Begleit-App (nur eigenes, registriertes Gerät).
// Standort alle 10 Min via Foreground-Service, Offline-Queue, manueller SOS-Button.
// Hinweis: Hintergrundintervalle begrenzt Android (Doze/Akkuspar) – keine Exaktheitsgarantie.
package de.agentenplattform.safety

import android.app.*
import android.content.Intent
import android.os.*
import androidx.core.app.NotificationCompat

class StandortService : Service() {
    companion object {
        const val KANAL = "standort"
        const val INTERVALL_MS = 10 * 60 * 1000L
    }
    private var handler: Handler? = null
    private val auftrag = object : Runnable {
        override fun run() {
            StandortQueue.einreihen(this@StandortService)
            Synchronisierung.versuchen(this@StandortService)
            handler?.postDelayed(this, INTERVALL_MS)
        }
    }
    override fun onCreate() {
        val kanal = NotificationChannel(KANAL, "Standort", NotificationManager.IMPORTANCE_LOW)
        (getSystemService(NOTIFICATION_SERVICE) as NotificationManager).createNotificationChannel(kanal)
        val info = NotificationCompat.Builder(this, KANAL).setContentTitle("Standort aktiv")
            .setContentText("Letzte Sync: ${Synchronisierung.letzteSync(this)}").build()
        startForeground(1, info)
        handler = Handler(Looper.getMainLooper()); handler?.post(auftrag)
    }
    override fun onBind(intent: Intent?) = null
    override fun onDestroy() { handler?.removeCallbacks(auftrag); super.onDestroy() }
}
