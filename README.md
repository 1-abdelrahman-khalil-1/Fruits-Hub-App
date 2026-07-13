# Fruits Hub

Fruits Hub is a Flutter-based grocery e-commerce application powered by Supabase. Built using the MVVM architecture and Repository Pattern, it delivers a modern shopping experience while maintaining a scalable and maintainable codebase.

This repository hosts the client-facing mobile application. The administrative companion app for catalog and order management can be found in the [Fruits Hub Admin Dashboard](https://github.com/1-abdelrahman-khalil-1/Dashboard-of-FruitsHub-App) repository.

## Demo

Explore the application's primary user flows below.

<details>
  <summary>Authentication and Onboarding Screens</summary>
  <br>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/0abed4b8-8ec4-46b1-a029-747b469ce8ac" width="200" alt="Onboarding 1">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/35746e17-a456-45ef-ae84-d666ab31f81f" width="200" alt="Splash 2">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/130d085e-aecf-40a4-be1c-43f53e5e9a13" width="200" alt="Splash 1">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/fd3c2ccc-d4a1-4f64-9643-cbe4038a83b0" width="200" alt="Login Empty">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/3e23ac2f-47cc-4ca8-9932-0c7f612a5e18" width="200" alt="Login Filled">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/7d5dbe0e-9ea9-4f5f-935e-7462122706c8" width="200" alt="Sign Up Empty">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/3d5beaf2-ef47-4d48-bda7-5b86c2b06cd6" width="200" alt="Sign Up Filled">
  </p>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/ed535436-c07a-4890-97c0-47bd4891a6bb" width="200" alt="Forgot Password">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/25a4c643-315f-4f42-a598-37960cc26918" width="200" alt="Verify OTP">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/780ac3d5-d0f5-4b1d-b49b-4c331c41f12f" width="200" alt="Reset Password">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/066e0e54-49dc-49b4-a7c2-c495890928a5" width="200" alt="Success Dialog">
  </p>
</details>

<details>
  <summary>Shop and Product Details</summary>
  <br>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/5b07d563-d642-4a03-8950-673dbcc74ceb" width="200" alt="Home Dashboard">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/2a236702-4f30-48ea-8aca-48e4eed95a9c" width="200" alt="Popular Products">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/ecc3f0b5-0d43-4dcd-8763-ec6a8937d0ea" width="200" alt="Product Details">
  </p>
</details>

<details>
  <summary>Categories and Filtering</summary>
  <br>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/d1612405-05fb-4919-9f39-3322fe11d0cd" width="200" alt="Categories Listing">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/ca64dbf4-505b-4740-a907-b6f07b09de15" width="200" alt="Filtering Options">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/1794d48e-983c-4c84-b777-047a32255317" width="200" alt="Filtered Products">
  </p>
</details>

<details>
  <summary>Search, Cart and Checkout Flows</summary>
  <br>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/0a23a7a9-90e7-42b1-9659-2247c88dd4fe" width="200" alt="Search Page">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/a1da2552-4bad-4aef-9fdc-f667fa35c9a8" width="200" alt="Search Results">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/056d9d8e-58a6-4c80-b6c9-1b707a5f31df" width="200" alt="Cart Screen">
  </p>
  <br>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/8060ba02-1083-482c-bbd9-a2e2dde66360" width="200" alt="Checkout Step 1">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/bd4b306b-2ea9-4d5f-a7c2-e532ab3f5674" width="200" alt="Checkout Step 2">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/01fb821c-f90b-43d3-8a12-444358a05c68" width="200" alt="Checkout Step 3">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/964c95fc-8206-4bc6-ac3f-6e5dd126accb" width="200" alt="Checkout Success">
  </p>
</details>

<details>
  <summary>Profile and App Configurations</summary>
  <br>
  <p align="center">
    <img src="https://github.com/user-attachments/assets/3b7ee66e-2751-46cf-a69e-680149767148" width="200" alt="Profile Options">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/ddbc5058-125c-4a1e-87b1-7adba21e6643" width="200" alt="Editing Profile">&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/user-attachments/assets/ce735ba4-fc1f-4568-ac45-7b71b8339c55" width="200" alt="Dark Mode Toggle">
  </p>
</details>

---

## Overview

Fruits Hub provides a modern mobile shopping experience for browsing products, managing favorites, and completing a structured checkout flow. The application focuses on responsive performance, intuitive navigation, and a clean shopping experience.

This mobile client application integrates with the same Supabase database backend that powers the administrative web companion app, allowing updates made in the [Fruits Hub Admin Dashboard](https://github.com/1-abdelrahman-khalil-1/Dashboard-of-FruitsHub-App) (such as new stock additions or category changes) to reflect instantly inside the client mobile app.

---

## Features

### Authentication and Security
* **Multi-Provider Authentication**: Register and login securely using Email/Password or Google Sign-In.
* **Session Management**: Session persistence across launches using SharedPreferences.
* **OTP Recoveries**: Structured flow for recovering passwords using verification codes (UI templates provided).

### Product Discovery and Catalog
* **Dynamic Product Catalog**: Products are retrieved from Supabase using optimized database queries with support for filtering and sorting.
* **Multi-Criteria Filtering**: Filter catalog items by categories, price ranges, or alphabetical sorting.
* **Server-side Search**: Search products using Supabase database queries for fast and efficient filtering.

### Cart and Checkout experience
* **State-Controlled Cart**: Add, subtract, or remove products instantly with synchronized cost recalculations.
* **Structured Checkout**: Multi-step checkout process covering delivery details, payment selections, and order summary.
* **Interactive List Controls**: Integration of custom refresh gestures and scroll-to-refresh loaders.

### Personalization
* **Favorites System**: Keep list items synchronized with Supabase backend storage.
* **Theme Management**: Switch instantly between Light and Dark mode appearances.
* **Account Customization**: Edit display name, email, and personal information directly.

---

## Tech Stack

| Technology | Category | Purpose |
| :--- | :--- | :--- |
| **Flutter** | Frontend SDK | Cross-platform UI development |
| **Supabase** | Backend-as-a-Service | Real-time database, Authentication, and Storage |
| **Cubit (flutter_bloc)** | State Management | Reactive UI updates and business logic separation |
| **GoRouter** | Routing | Declarative routing with custom page transition animations |
| **GetIt** | Service Locator | Lightweight dependency injection |
| **Dartz** | Functional Programming | Safe error handling using `Either` (`Left` / `Right`) |
| **SharedPreferences**| Local Storage | Persistence of session status and onboarding state |
| **ScreenUtil** | Responsive Design | Resolution-independent font scaling and UI sizing |
| **EasyRefresh** | UI Utilities | Customizable pull-to-refresh and infinite scroll logic |

---

## Architecture

The project follows the Model-View-ViewModel (MVVM) architecture combined with the Repository Pattern and dependency injection using GetIt to maintain a modular and maintainable codebase.

```
      View
        │ (Listens / Triggers)
        ▼
ViewModel (Cubit)
        │ (Calls Contract)
        ▼
   Repository
        │ (Injected Implementation)
        ▼
Supabase Services
```

1. **View Layer (`lib/Features/*/presentation/views`)**: Contains widgets, layouts, and animations. Completely independent of data sources and domain rules.
2. **ViewModel Layer (`lib/Features/*/presentation/Cubits`)**: Cubits capture UI interactions, execute business workflows, and emit state updates to which the View reacts.
3. **Data Layer (Repository Pattern)**:
   * **Repositories (`lib/Core/repo`, `lib/Features/*/Data/repo`)**: Define contracts for fetching/modifying data. They leverage dartz's `Either` type to return compilation-safe errors (`Left`) or success models (`Right`).
   * **Services (`lib/Core/services`)**: Concrete implementations of data retrieval methods (such as `SupabaseAuth` implementing `AuthenticationService`, `SupabaseStorage` implementing `StorageService`).

---

## Project Structure

```
lib/
├── Core/
│   ├── cubit/            # App-wide Cubits (Cart, Theme, Favourite, Products)
│   ├── errors/           # Global exception definitions
│   ├── model/            # Shared data models (CartModel, ProductModel)
│   ├── repo/             # Global repository interfaces and implementations
│   ├── services/         # Third-party integrations (Supabase, Auth, Storage)
│   └── utils/            # Shared constants, router, and assets
└── Features/             # Modular, self-contained business features
    ├── Auth/             # Logins, signups, Google Auth, OTP screens
    ├── Cart/             # Cart widgets and layouts
    ├── Category/         # Category lists and price/alphabetical filters
    ├── Checkout Screen/  # Delivery address, payment options, and summary
    ├── Details_for_product/# Deep product detail views
    ├── Favourite/        # Favorites listing screen
    ├── Home/             # Main Dashboard with search and banners
    ├── Profile/          # Profile editing and preference toggles
    ├── Search/           # Real-time keyword filtering
    └── SplashScreen/     # Animated Splash and onboarding flows
```

---

## My Contributions

As the sole Flutter developer, I designed the application architecture and implemented the entire mobile application from the provided UI design.

* **Architecture & Layout Engineering**: Designed the hybrid modular/feature-first folder structure and implemented the MVVM design pattern. Decoupled direct dependencies using interface-driven contracts.
* **Ecosystem Database Integration**: Integrated the mobile application with Supabase services and the companion admin dashboard, enabling synchronized product and category management.
* **Secure Authentication Flow**: Configured the authentication architecture, integrating email signup/login flows with Supabase Auth, along with Google OAuth credentials for single sign-on.
* **State Management**: Implemented reactive states using `flutter_bloc` (Cubit), managing Cart items, theme styling configurations, favorite lists, and dynamic product catalogs globally.
* **Repository & Service Decoupling**: Implemented repository abstractions with functional error handling using Dartz's Either type.
* **Navigation & Custom Animations**: Programmed dynamic paths using `GoRouter`, including context-aware sliding transition animations depending on navigation origin.
* **Responsive Visual Polish**: Built responsive UI components using ScreenUtil, optimized image loading with cached_network_image, and implemented skeleton loading states using Skeletonizer.
