# Flutter Commands Reference Guide

## Project Management Commands

### Create New Project
```bash
flutter create my_app
```
- Creates a new Flutter project with default template
- Generates folder structure, dependencies, and sample code

```bash
flutter create --org com.example my_app
```
- Creates project with custom organization identifier
- Useful for publishing apps

```bash
flutter create --platforms=android,ios my_app
```
- Creates project for specific platforms only
- Reduces project size if you don't need all platforms

---

## Running & Building Commands

### Run Application
```bash
flutter run
```
- Runs app on the default connected device
- Enables hot reload during development

```bash
flutter run -d chrome
```
- Runs app on specific device (Chrome browser)
- Other options: `-d windows`, `-d android`, `-d edge`

```bash
flutter run --release
```
- Runs app in release mode (optimized, no debugging)
- Use for performance testing

```bash
flutter run --profile
```
- Runs in profile mode
- Balance between debug and release for performance profiling

### Build Application
```bash
flutter build apk
```
- Builds Android APK file for distribution
- Output: `build/app/outputs/flutter-apk/app-release.apk`

```bash
flutter build appbundle
```
- Builds Android App Bundle (recommended for Play Store)
- Smaller download size for users

```bash
flutter build web
```
- Builds web application
- Output in `build/web/` folder

```bash
flutter build windows
```
- Builds Windows desktop application
- Requires Visual Studio with C++ workload

```bash
flutter build ios
```
- Builds iOS application (requires Mac)
- For App Store submission

---

## Device Management Commands

### List Devices
```bash
flutter devices
```
- Shows all connected devices and emulators
- Displays device ID, platform, and status

```bash
flutter devices --machine
```
- Outputs device list in JSON format
- Useful for automation scripts

### List Emulators
```bash
flutter emulators
```
- Shows available Android emulators
- Lists emulator IDs for launching

```bash
flutter emulators --launch <emulator_id>
```
- Starts specific Android emulator
- Example: `flutter emulators --launch Pixel_5_API_33`

---

## Dependency Management Commands

### Get Dependencies
```bash
flutter pub get
```
- Downloads and installs all dependencies from `pubspec.yaml`
- Run after modifying dependencies

```bash
flutter pub upgrade
```
- Updates all dependencies to latest compatible versions
- Respects version constraints in `pubspec.yaml`

```bash
flutter pub outdated
```
- Shows which packages can be updated
- Displays current vs latest versions

### Add Packages
```bash
flutter pub add http
```
- Adds package to `pubspec.yaml` and installs it
- Quick way to add dependencies

```bash
flutter pub add --dev flutter_test
```
- Adds package as dev dependency
- Only used during development

```bash
flutter pub remove package_name
```
- Removes package from `pubspec.yaml`
- Cleans up unused dependencies

---

## Code Analysis & Testing Commands

### Analyze Code
```bash
flutter analyze
```
- Analyzes code for errors, warnings, and style issues
- Uses rules from `analysis_options.yaml`

```bash
flutter analyze --no-fatal-infos
```
- Runs analysis without treating info messages as errors
- Useful in CI/CD pipelines

### Format Code
```bash
flutter format .
```
- Formats all Dart files in current directory
- Applies consistent code style

```bash
flutter format lib/main.dart
```
- Formats specific file
- Use `--output=none` to check without modifying

### Run Tests
```bash
flutter test
```
- Runs all unit and widget tests
- Tests located in `test/` folder

```bash
flutter test test/widget_test.dart
```
- Runs specific test file
- Useful for focused testing

```bash
flutter test --coverage
```
- Runs tests and generates coverage report
- Output: `coverage/lcov.info`

---

## Diagnostic Commands

### Flutter Doctor
```bash
flutter doctor
```
- Checks Flutter installation and environment
- Shows missing dependencies and configuration issues

```bash
flutter doctor -v
```
- Verbose output with detailed information
- Helpful for troubleshooting

```bash
flutter doctor --android-licenses
```
- Accepts Android SDK licenses
- Required for Android development

### Check Version
```bash
flutter --version
```
- Shows Flutter version, channel, and tools
- Includes Dart and DevTools versions

```bash
flutter channel
```
- Shows current Flutter channel (stable, beta, dev)
- Lists all available channels

```bash
flutter upgrade
```
- Updates Flutter to latest version on current channel
- Also updates dependencies

```bash
flutter downgrade
```
- Downgrades Flutter to previous version
- Useful if upgrade causes issues

---

## Cleaning & Maintenance Commands

### Clean Build
```bash
flutter clean
```
- Deletes `build/` folder
- Fixes build-related issues

```bash
flutter pub cache clean
```
- Clears package cache
- Use when packages are corrupted

```bash
flutter pub cache repair
```
- Re-downloads all packages
- Fixes package corruption issues

---

## Configuration Commands

### Flutter Config
```bash
flutter config --android-sdk /path/to/android/sdk
```
- Sets custom Android SDK path
- Useful for non-standard installations

```bash
flutter config --enable-web
```
- Enables web support (already enabled by default in newer versions)

```bash
flutter config --no-analytics
```
- Disables anonymous usage statistics
- Privacy-focused option

---

## Hot Reload Commands (During `flutter run`)

While app is running with `flutter run`:

- **`r`** - Hot reload (fast, preserves state)
- **`R`** - Hot restart (full restart, resets state)
- **`q`** - Quit the app
- **`d`** - Detach (leaves app running, stops monitoring)
- **`h`** - Show all available commands
- **`c`** - Clear the console

---

## Advanced Commands

### Generate Code
```bash
flutter pub run build_runner build
```
- Runs code generation (for packages like json_serializable)
- Generates `.g.dart` files

```bash
flutter pub run build_runner watch
```
- Watches for changes and regenerates code automatically
- Useful during active development

### Performance Profiling
```bash
flutter run --profile --trace-startup
```
- Profiles app startup performance
- Generates timeline data

### Generate App Bundle Signature
```bash
flutter build apk --split-per-abi
```
- Builds separate APKs for each CPU architecture
- Reduces APK size for users

---

## Troubleshooting Commands

### Fix Common Issues
```bash
flutter clean && flutter pub get
```
- Clean build and reinstall dependencies
- First step for most build issues

```bash
flutter doctor --android-licenses
```
- Accept all Android licenses
- Fixes Android license issues

```bash
flutter pub cache repair
```
- Repairs corrupted package cache
- Fixes dependency-related errors

---

## Package Information

### Show Package Details
```bash
flutter pub deps
```
- Shows dependency tree
- Displays all direct and transitive dependencies

```bash
flutter pub deps --style=compact
```
- Shows compact dependency tree
- Easier to read for large projects

---

## Quick Reference Summary

| Command | Use Case |
|---------|----------|
| `flutter create` | Create new project |
| `flutter run` | Run app on device |
| `flutter build apk` | Build Android APK |
| `flutter pub get` | Install dependencies |
| `flutter doctor` | Check installation |
| `flutter clean` | Clean build files |
| `flutter test` | Run tests |
| `flutter analyze` | Check code quality |
| `flutter devices` | List devices |
| `flutter upgrade` | Update Flutter |

---

## Tips

1. **Always run `flutter doctor` first** - Ensures environment is set up correctly
2. **Use `flutter clean` when in doubt** - Fixes most build-related issues
3. **Hot reload (`r`) vs Hot restart (`R`)** - Hot reload is faster but doesn't update const values
4. **Profile mode for performance testing** - Use `--profile` flag instead of debug mode
5. **Format before committing** - Run `flutter format .` to maintain code style

---

**Last Updated:** February 2026  
**Flutter Version:** 3.38.9+
