package org.aossie.carbontracker
//package org.aossie.carbontracker
//
//import android.content.Context
//
//import androidx.health.connect.client.HealthConnectClient
//import androidx.health.connect.client.HealthConnectFeatures
//
//import java.util.concurrent.TimeUnit
//
//fun enqueueBackgroundReadWorker(context: Context, healthConnectClient: HealthConnectClient) {
//    if (healthConnectClient
//            .features
//            .getFeatureStatus(
//                HealthConnectFeatures.FEATURE_READ_HEALTH_DATA_IN_BACKGROUND
//            ) == HealthConnectFeatures.FEATURE_STATUS_AVAILABLE
//    ) {
//
//        val periodicWorkRequest = PeriodicWorkRequestBuilder<ScheduleWorker>(1, TimeUnit.HOURS)
//            .build()
//
//        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
//            "read_health_connect",
//            ExistingPeriodicWorkPolicy.KEEP,
//            periodicWorkRequest
//        )
//    }
//}
