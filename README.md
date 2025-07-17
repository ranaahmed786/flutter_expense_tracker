# Flutter Expense Tracker

A modern, cross-platform expense tracking application built with Flutter. Track your daily expenses, visualize spending patterns through interactive charts, and manage your financial data with an intuitive user interface.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the Application](#running-the-application)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Dependencies](#dependencies)
- [Platform Support](#platform-support)
- [Contributing](#contributing)
- [License](#license)

## Features

### Core Functionality
- **Expense Management**: Add, edit, and delete expenses with ease
- **Categorization**: Organize expenses by categories (Food, Travel, Leisure, Work)
- **Date Tracking**: Record and track expenses by specific dates
- **Data Visualization**: Interactive charts showing expense distribution
- **Responsive Design**: Optimized for both mobile and tablet devices

### User Experience
- **Intuitive Interface**: Clean, modern Material Design UI
- **Smart Input Validation**: Comprehensive form validation with user-friendly error messages
- **Undo Functionality**: Recover accidentally deleted expenses with snackbar actions
- **Adaptive Layout**: Responsive design that adapts to different screen sizes and orientations
- **Keyboard Optimization**: Smart keyboard handling with proper scrolling behavior

### Technical Features
- **Cross-Platform**: Runs on Android, iOS, Web, Windows, macOS, and Linux
- **State Management**: Efficient state management using Flutter's built-in StatefulWidget
- **Data Persistence**: Local data storage for expense records
- **Type Safety**: Full Dart type safety with null safety support

## Screenshots

### Main Dashboard

<img width="300" height="550" alt="image" src="https://github.com/user-attachments/assets/1df606c0-fb0a-43d8-9040-aeec6a08df58" />

### Add Expense Modal

<img width="300" height="550" alt="image" src="https://github.com/user-attachments/assets/57c684a6-3b58-41db-ab71-bc2611b7a088" />

## Getting Started

### Prerequisites

Before running this application, ensure you have the following installed:

- **Flutter SDK**: Version 3.0 or higher
- **Dart SDK**: Version 2.17 or higher
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**: For version control

For platform-specific development:
- **Android**: Android Studio with Android SDK
- **iOS**: Xcode (macOS only)
- **Web**: Chrome browser
- **Desktop**: Platform-specific toolchain

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ranaahmed786/flutter_expense_tracker.git
   cd flutter_expense_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```

### Running the Application

#### Development Mode
```bash
flutter run
```

#### Platform-Specific Builds

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

**Web:**
```bash
flutter run -d chrome
```

**Desktop:**
```bash
# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

#### Production Builds

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

**Web:**
```bash
flutter build web --release
```

## Architecture

This application follows Flutter's recommended architecture patterns:

### State Management
- **StatefulWidget**: Used for managing local component state
- **setState()**: For reactive UI updates
- **Callback Functions**: For parent-child communication

### Data Flow
- **Unidirectional Data Flow**: Data flows down, events flow up
- **Immutable Models**: Data classes with immutable properties
- **Separation of Concerns**: Clear separation between UI and business logic

### File Organization
- **Widget-Based Structure**: Organized by UI components
- **Model-View Separation**: Clean separation of data models and UI
- **Reusable Components**: Modular, reusable widget components

## Project Structure

```
lib/
├── main.dart                     # Application entry point
├── models/
│   └── expense.dart             # Expense data model
└── widgets/
    ├── my_app.dart              # Root application widget
    ├── expenses.dart            # Main expense management screen
    ├── new_item_overlay.dart    # Add expense modal
    ├── chart/
    │   └── chart.dart           # Expense visualization charts
    └── expenseslist/
        ├── expenses_list.dart   # Expense list display
        └── expense_item.dart    # Individual expense item widget

android/                         # Android-specific files
ios/                            # iOS-specific files
web/                            # Web-specific files
windows/                        # Windows-specific files
macos/                          # macOS-specific files
linux/                          # Linux-specific files
test/                           # Unit and widget tests
```

## Dependencies

### Core Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | Core Flutter framework |
| `cupertino_icons` | ^1.0.8 | iOS-style icons |

### UI & Visualization
| Package | Version | Purpose |
|---------|---------|---------|
| `google_fonts` | ^6.2.1 | Custom typography |
| `fl_chart` | ^0.69.2 | Interactive charts and graphs |

### Utility Libraries
| Package | Version | Purpose |
|---------|---------|---------|
| `uuid` | ^4.5.1 | Unique identifier generation |
| `intl` | ^0.19.0 | Internationalization and date formatting |

### Development Dependencies
| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | SDK | Testing framework |
| `flutter_lints` | ^4.0.0 | Code quality and linting |

## Platform Support

| Platform | Status | Minimum Version |
|----------|--------|-----------------|
| Android | ✅ Supported | API 21 (Android 5.0) |
| iOS | ✅ Supported | iOS 12.0 |
| Web | ✅ Supported | Modern browsers |
| Windows | ✅ Supported | Windows 10 |
| macOS | ✅ Supported | macOS 10.14 |
| Linux | ✅ Supported | Ubuntu 18.04+ |

## Contributing

We welcome contributions to improve the Flutter Expense Tracker! Here's how you can contribute:

### Getting Started
1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### Contribution Guidelines
- Follow Flutter and Dart style guidelines
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

### Code Style
- Use `flutter analyze` to check for issues
- Follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Maintain consistent code formatting using `dart format`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ using Flutter**

For questions, suggestions, or support, please open an issue on GitHub or contact the development team.
