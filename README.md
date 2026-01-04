# Sheba.AI

**Revolutionizing Healthcare Accessibility in Bangladesh**

Sheba.AI is a cross-platform mobile application designed to bridge the gap between patients and healthcare services. By leveraging advanced AI, it decodes handwritten prescriptions, cross-references them with a massive medicine database, and enables seamless one-click ordering. Built with a focus on user safety and adherence, it addresses key challenges like dosage errors and fragmented healthcare systems.

---

## Features

- **AI-Powered Prescription Analysis**: Utilizes **Gemini Pro 2.5 Vision-Language Model** to decipher complex handwritten prescriptions with high accuracy.
- **Comprehensive Medicine Database**: Instant access to **21,000+ medicines** with detailed information including brand, generic name, strength, and pricing (Sourced via MedEx scraping).
- **One-Click Ordering**: Streamlined cart management and checkout process for quick medicine purchase.
- **Image Scan & Upload**: Robust image processing to capture and analyze prescriptions.
- **Order Tracking**: Real-time updates on order status and history.
- **Secure Authentication**: **JWT-based** user management ensures data privacy and security.
- **Smart Reminders**: (Coming Soon) Medication adherence notifications.
- **Modern UI/UX**: Built with **Material Design**, featuring smooth animations, glassmorphism elements, and **Dark Mode** support.

---

## Architecture

Sheba.AI follows a strict **Clean Architecture** pattern to ensure scalability, testability, and maintainability. This separation of concerns allows for independent development of core business logic and UI/Frameworks.

### 1. **Domain Layer** (Inner Layer)
*The heart of the application. Independent of any external libraries.*
- **Entities**: Core business objects (e.g., `Medicine`, `User`, `Order`).
- **Repositories (Interfaces)**: Abstract definitions of data operations.
- **Use Cases**: Specific business logic executors.

### 2. **Data Layer** (Middle Layer)
*Handles data retrieval and transformation.*
- **Models**: DTOs (Data Transfer Objects) annotated with `freezed` & `json_serializable`.
- **Repositories (Implementations)**: Concrete implementations of domain repositories.
- **Data Sources**:
    - **Remote**: REST API calls using **Dio** (w/ Interceptors for JWT).
    - **Local**: Caching and persistence with **Hive** and **SharedPreferences**.

### 3. **Presentation Layer** (Outer Layer)
*The UI and State Management.*
- **State Management**: **Riverpod** is used for dependency injection (Service Locator pattern) and reactive state management.
- **UI**: Flutter widgets, leveraging `flutter_screenutil` for responsiveness.
- **Notifier/Provider**: Bridges the UI with Use Cases.

---

## Tech Stack & Dependencies

### Core
- **Framework**: Flutter (Dart)
- **Language**: Dart 3.x
- **State Management**: [flutter_riverpod](https://pub.dev/packages/flutter_riverpod)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) & Riverpod

### Network & Data
- **Networking**: [dio](https://pub.dev/packages/dio)
- **Local Storage**: [hive](https://pub.dev/packages/hive), [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Serialization**: [freezed](https://pub.dev/packages/freezed), [json_serializable](https://pub.dev/packages/json_serializable)

### Interface & UX
- **Styling**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil), [flutter_svg](https://pub.dev/packages/flutter_svg)
- **Animations**: [animate_do](https://pub.dev/packages/animate_do), [lottie](https://pub.dev/packages/lottie), [shimmer](https://pub.dev/packages/shimmer), [skeletonizer](https://pub.dev/packages/skeletonizer)
- **UI Components**: [toastification](https://pub.dev/packages/toastification), [carousel_slider_plus](https://pub.dev/packages/carousel_slider_plus), [awesome_snackbar_content](https://pub.dev/packages/awesome_snackbar_content)
- **Forms**: [flutter_form_builder](https://pub.dev/packages/flutter_form_builder), [form_builder_validators](https://pub.dev/packages/form_builder_validators)

### Utilities
- **Date/Time**: [intl](https://pub.dev/packages/intl), [timeago](https://pub.dev/packages/timeago)
- **Permissions**: [permission_handler](https://pub.dev/packages/permission_handler)
- **Logging**: [logger](https://pub.dev/packages/logger)
- **Launcher**: [url_launcher](https://pub.dev/packages/url_launcher)

### Backend (Reference)
- **Framework**: Django REST Framework
- **AI**: Gemini Pro 2.5
- **Image Processing**: Pillow (Python)
- **Database**: SQLite (Dev) / PostgreSQL (Prod)

---

## Project Structure

```
lib/
├── data/
│   ├── datasource/     # Remote and Local data sources
│   ├── model/          # DTOs (Freezed models)
│   └── repository/     # Repository Implementations
├── domain/
│   ├── entity/         # Pure business objects
│   ├── repository/     # Repository Interfaces
│   └── usecase/        # Business logic classes
├── presentation/
│   ├── screeen/        # UI Screens
│   ├── widgets/        # Reusable standard widgets
│   └── notifier/       # State Notifiers (Riverpod)
├── di/                 # Dependency Injection modules
├── service/            # App-wide services (Notification, etc.)
└── main.dart           # Entry point
```

---

## Getting Started

### Prerequisites
- Flutter SDK (`^3.8.1`)
- Dart SDK

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Noctambulist007/Sheba_AI.git
   cd sheba_ai
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run Code Generation**
   This project uses `freezed` and `hive` which require code generation.
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

### Build for Release

**Android**
```bash
flutter build apk --release
```

**iOS** (macOS only)
```bash
flutter build ios --release
```
