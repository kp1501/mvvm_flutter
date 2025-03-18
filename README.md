# Flutter Clean Architecture Base (MVVM + BLoC)

## 📌 Overview
This is a **Flutter base project** following **Clean Architecture** using **MVVM pattern** with **BLoC state management**. It serves as a starting point for scalable and maintainable Flutter applications.

## 🚀 Features
- **MVVM Clean Architecture**
- **BLoC State Management**
- **Dependency Injection with GetIt**
- **Local Database (Hive/SharedPreferences)**
- **Network Requests using Dio**
- **Repository Pattern for Data Handling**
- **Scalable and Testable Structure**

## 📂 Folder Structure
```
lib/
 ├── core/                # Common utilities, error handling, DI
 │    ├── di/             # Dependency Injection (GetIt)
 │    ├── error/          # Failure classes and exceptions
 │    ├── api/            # For internet api call
 │    ├── utils/          # Common helper functions
 │
 ├── data/                # Data Layer (Fetching & Storage)
 │    ├── datasources/    # Local & Remote Data Sources
 │    ├── models/         # Data Models (DTOs)
 │    ├── repositories/   # Implements Domain Repositories
 │
 ├── domain/              # Business Logic Layer
 │    ├── entities/       # Core Business Objects
 │    ├── repositories/   # Abstract Repository Interfaces
 │    ├── usecases/       # Application-specific Logic
 │
 ├── presentation/        # UI Layer
 │    ├── blocs/          # BLoC State Management
 │    ├── pages/          # UI Screens
 │    ├── widgets/        # Reusable Widgets
 │
 ├── main.dart            # Entry Point
```

## 🔧 Setup Instructions
### 1️⃣ Clone the Repository
```sh
git clone https://github.com/kp1501/mvvm_flutter.git
cd mvvm-flutter
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Run the App
```sh
flutter run
```

## 🏗 Architecture Overview
This project follows **Clean Architecture**, dividing the app into three layers:
1. **Data Layer** (API Calls, Local Storage, Data Mapping)
2. **Domain Layer** (Business Logic, Use Cases, Repositories)
3. **Presentation Layer** (UI, BLoC, Screens, Widgets)

### 🔹 State Management (BLoC)
BLoC is used to handle state changes and event-driven updates.
```dart
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchTodosUseCase fetchTodosUseCase;

  TodoBloc(this.fetchTodosUseCase) : super(TodoInitial()) {
    on<FetchTodosEvent>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos = await fetchTodosUseCase();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
```

## 🛠 Tech Stack
- **State Management**: BLoC (flutter_bloc)
- **Dependency Injection**: GetIt
- **Network Requests**: Dio
- **Local Storage**: Hive / SharedPreferences
- **Architecture**: Clean Architecture (MVVM)

## 📜 License
This project is licensed under the **MIT License**.

---

🔥 **Happy Coding!** 🚀


