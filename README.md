## Setup Flutter
Install Flutter SDK
```bash
mkdir ~/SDKs && cd "$_";
curl -O https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.8-stable.tar.xz;
tar xf flutter_linux_3.16.8-stable.tar.xz;
```

Update your PATH
```bash
export PATH=$PATH:/home/user/SDKs/flutter/bin
```

Validate Installation
```bash
flutter doctor
```
## Setup AVD Emulator (Optional)
You should download [CMD-tools](https://developer.android.com/studio#:~:text=Command%20line%20tools%20only) and [Platform-tools](https://developer.android.com/tools/releases/platform-tools#downloads) from the official website. You can find more explicit walkthrough [here](https://medium.com/@ilyadubrivvin/tutorial-simple-image-detection-android-app-358a2c10bfb7).

**⚠️Make sure that contents of cmdline-tools folder are nested in _<u>latest</u>_ folder⚠️**
```
cmdline-tools/
└── latest/
 ⠀⠀ ├── bin/
 ⠀⠀ |⠀ ⠀└──...
⠀ ⠀ ├── lib/
 ⠀⠀ |⠀ ⠀└──...
⠀ ⠀ ├── NOTICE.txt
 ⠀⠀ └── source.properties
```

Include them to your **PATH** as well.
```bash
export ANDROID_SDK_ROOT=/path/to/unziped/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator #Will be genrated in next step
```
Validate installation
```bash
sdkmanager --version
avdmanager --help
```

Choose emulator
```bash
sdkmanager --list
```

Create emulator. Next command will install AVD image together with necessary packages and create emulator out of it.
```bash
sdkmanager "build-tools;31.0.0" "platforms;android-31" "system-images;android-31;google_apis;x86_64"
avdmanager create avd -n MyDevice -k "system-images;android-31;google_apis;x86_64"
```
Validate emulator cration

```bash
emulator -list-avds #list all availble emulators

#run emulator
flutter emulators --launch MyDevice
#or
emulator -avd MyDevice 
```
## Setup USB debugging with scrcpy (Optional)
You can follow instructions [here](https://github.com/Genymobile/scrcpy?tab=readme-ov-file#:~:text=OTG%20mode.-,Get%20the%20app,-Linux)

This application mirrors Android devices (video and audio) connected via USB or over TCP/IP, and allows to control the device with the keyboard and the mouse of the computer. It does not require any root access. It works on Linux, Windows and macOS.

to start debugging connect phone to your computer with usb and run:
```bash
scrcpy
```


## Run application

Run these commands
```bash
flutter run
```
