
<p align="center">
 <img src="https://github.com/iamtheblackunicorn/UnicornLauncher/raw/main/assets/images/banner.png"/>
</p>

# UNICORN LAUNCHER :unicorn:

*An aesthetically-pleasing launcher for Unicorns! :unicorn:*

## About :books:

D'you remember FlowHome? I do and it was dope! So, I wanted to create something similar to FlowHome. *Unicorn Launcher* is my attempt at re-creating this iconic launcher!

## Features :black_heart:

- Carefully-curated quotes by famous people on your homescreen.
- Carefully-curated sexy wallpapers that alternate every 5 minutes.
- Simplistic layout.
- Modern, elegant design.

## Download :inbox_tray:

- *Dark Horse* (v.1.0.0): [Download](https://github.com/iamtheblackunicorn/UnicornLauncher/releases/download/v.1.0.0/UnicornLauncher-v1.0.0-DarkHorse-Release.apk) (16.9 MB)

## Building :hammer:

Make sure that you have the following programs installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *Unicorn Launcher*.

## Changelog :black_nib:

### Version 1.0.0: Initial Release:

- upload to GitHub

## Note :scroll:

- *Unicorn Launcher* :unicorn: by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- licensed under the MIT license.
