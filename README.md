# testapp

A new Flutter project.
Made using the Bloc State management.

# Clean Architecture in Flutter

## Entities (Core Layer)
- Represents core business models and rules.
- Independent of any platform or UI.

## Use Cases / Interactors
- Contains application-specific business rules.
- Coordinates data flow between entities and repositories.

## Repository Interfaces
- Abstract definitions of data sources (e.g., local database, remote API).

## Data Layer
- Implements repository interfaces.
- Manages data retrieval, storage, and caching.
- Includes data sources such as APIs and local databases.

## Presentation Layer
- UI components (Widgets, State Management).
- Interacts with Use Cases.

---

## Typical Flutter Project Structure

lib/
├── core/              
<!--# Core functionalities and utilities  -->
│   └── entities/
│   └── usecases/
<!-- # Data sources and repository implementations -->
├── data/                         
│   └── models/
│   └── repositories/
│   └── datasources/
<!-- # Business logic and repository interfaces -->
├── domain/                       
│   └── entities/
│   └── repositories/
<!-- # UI and state management -->
├── presentation/                 
│   └── pages/
│   └── widgets/
│   └── state/
<!-- # Application entry point -->
└── main.dart                     
