# Flutter Provider Clean Architecture

A simple, boilerplate Flutter project demonstrating how to handle REST API calls using **Provider** for state management and a **Layered Architecture** approach.



## 🚀 Architecture Overview

This project follows a simplified Clean Architecture (Layered) to separate concerns and make the code testable and maintainable.

-   **Data Layer**: Contains Models and API Services (Network calls).
-   **Provider Layer**: Manages the business logic and app state.
-   **UI Layer**: Contains screens and reusable widgets.

## 📂 Project Structure

```text
lib/
├── data/
│   ├── models/       # Data classes with fromJson mapping
│   └── services/     # API Service using http package
├── providers/        # Logic & State (ChangeNotifier)
├── ui/
│   ├── screens/      # Full-page widgets
│   └── widgets/      # Small, reusable components
└── main.dart         # Entry point & Provider injection