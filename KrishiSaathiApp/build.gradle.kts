// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    kotlin("kapt") version "1.9.10" apply false
    id("com.android.application") version "8.1.0" apply false
    id("org.jetbrains.kotlin.android") version "1.8.0" apply false
    id("com.google.dagger.hilt.android") version "2.44" apply false
    id("androidx.navigation.safeargs.kotlin") version "2.7.2" apply false
    id("com.google.gms.google-services") version "4.4.0" apply false
}