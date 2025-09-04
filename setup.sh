#!/bin/bash

echo "🌀 Installing Flutter SDK..."
git clone https://github.com/flutter/flutter.git -b stable /home/vscode/flutter
export PATH="$PATH:/home/vscode/flutter/bin"
flutter precache
flutter doctor

echo "🌀 Installing Android SDK & Tools..."
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk wget unzip
wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -P /tmp
unzip -q /tmp/commandlinetools-latest.zip -d /home/vscode/android
export ANDROID_HOME="/home/vscode/android"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin"
sdkmanager --sdk_root=$ANDROID_HOME "platform-tools" "platforms;android-33" "build-tools;33.0.2" "emulator"
sdkmanager --sdk_root=$ANDROID_HOME --licenses

echo "🌀 Environment setup complete."
flutter doctor -v