# 🍏 Fruits Hub App  

Fruits Hub is a modern **e-commerce** application built with **Flutter** and **Supabase**, following the **MVVM architecture** and implementing the **Repository Pattern**. The app provides a seamless shopping experience, featuring authentication, product listings, filtering, a structured project architecture and can easy convert backend using like from Supabase to API or to Firebase.  

---

## ✨ Features  

### 🔑 **Authentication & User Management**  
- Sign Up & Sign In with email and password  
- Google Sign-In integration  
- Forgot password feature using OTP (UI only, no logic yet)  
- Splash & Onboarding screens  
- Authentication screens with form validation  
- Implemented Supabase authentication using the **Repository Pattern**  
### 🛍️ **Product Management**  
- Connected to **Supabase** and fetched products  
- Displayed product listings with **category-based filtering**  
- Implemented **price filtering** in `StorageService` and `ProductRepo`  
- Designed a **custom home screen UI** with:  
  - **Search field** (UI only, not yet functional)  
  - **Filter button** for enhanced filtering options  
- Fetched **product images** from **Supabase Storage**  
- Created a **Product Details Screen** (No cart interaction or reviews yet)  
- **Category Screen** with **price filtering** functionality  

### 🛒 **Cart & UI Enhancements**  
- Implemented **cart UI** with navigation (No logic or data integration yet)  
- Added new buttons:  
  - **Add & Remove product** (UI only, not yet functional)  
  - Enhanced product filtering functionality  
- Added **loading dialogs** and **error handling functions**  
- Used **EasyRefresh** package for better UI interactions   

---

## 🏗️ Project Structure  

The project follows a **clean and scalable architecture**, keeping separation of concerns in mind:  
lib/
# Project Structure (`lib/`)

The `lib/` directory contains the core application code, organized into a modular structure for better maintainability and scalability. Below is the detailed breakdown of the folder structure:

## Description of Each Folder

### `Core/`
This folder contains the core functionality and shared resources used across the application.

- **`services/`**: Houses services like `StorageService`, API handlers, and other business logic services.
- **`assets/`**: Stores app-wide constants such as colors, text styles, and other reusable assets.
- **`utils/`**: Contains utility functions, helper classes, and extensions that are used throughout the app.

### `Features/`
This folder follows a feature-based modular architecture, where each feature is self-contained and organized into layers.

- **`Screen/`**: Contains app screen and UI elements.
  - **`Data/`**: Represents the data layer of the app.
    - **`model/`**: Contains data models (e.g., `FruitModel`) that represent the structure of the data.
    - **`repo/`**: Implements the repository pattern to manage data sources (e.g., local database, API).
  - **`Presentation/`**: Represents the UI layer of the app.
    - **`view/`**: Contains the screens and layouts for the app.
      - **`widgets/`**: Houses reusable UI components (e.g., buttons, cards, lists).
     - **`cubit/`**: Manages the state of the app using the Cubit state management pattern.

---

This structure ensures a clean separation of concerns, making the codebase easier to maintain, test, and scale. Each feature is modular, allowing for independent development and testing.


---

## 🚀 Technologies Used  

- **Flutter** – For building the UI  
- **Dart** – Programming language  
- **Supabase** – Backend as a Service  
- **Cubit (Bloc Package)** – State management  
- **EasyRefresh** – UI interaction improvements  

---
## 📸 Screenshots  

### Authentication & Onboarding Screens  

![Onboarding1](https://github.com/user-attachments/assets/0abed4b8-8ec4-46b1-a029-747b469ce8ac)
![splash-2](https://github.com/user-attachments/assets/35746e17-a456-45ef-ae84-d666ab31f81f)
![splash-1](https://github.com/user-attachments/assets/130d085e-aecf-40a4-be1c-43f53e5e9a13)
<img width="375" alt="4  Login - Empty _ شاشة تسجيل دخول" src="https://github.com/user-attachments/assets/fd3c2ccc-d4a1-4f64-9643-cbe4038a83b0" />

<img width="375" alt="5  Login - Filled" src="https://github.com/user-attachments/assets/3e23ac2f-47cc-4ca8-9932-0c7f612a5e18" />
<img width="375" alt="6  Sign Up - Empty" src="https://github.com/user-attachments/assets/7d5dbe0e-9ea9-4f5f-935e-7462122706c8" />
<img width="375" alt="7  Sign Up - Filled" src="https://github.com/user-attachments/assets/3d5beaf2-ef47-4d48-bda7-5b86c2b06cd6" />
<img width="375" alt="8  Forgot Password - Phone" src="https://github.com/user-attachments/assets/ed535436-c07a-4890-97c0-47bd4891a6bb" />
<img width="375" alt="9  Password Recovery - Phone" src="https://github.com/user-attachments/assets/25a4c643-315f-4f42-a598-37960cc26918" />
<img width="375" alt="10  Reset your password" src="https://github.com/user-attachments/assets/780ac3d5-d0f5-4b1d-b49b-4c331c41f12f" />
<img width="375" alt="تم تغيير الباسورد بنجاح11" src="https://github.com/user-attachments/assets/066e0e54-49dc-49b4-a7c2-c495890928a5" />


### Home & Product Screen

![Home](https://github.com/user-attachments/assets/5b07d563-d642-4a03-8950-673dbcc74ceb)
![More popular](https://github.com/user-attachments/assets/2a236702-4f30-48ea-8aca-48e4eed95a9c)
![Item details](https://github.com/user-attachments/assets/ecc3f0b5-0d43-4dcd-8763-ec6a8937d0ea)

### Category 

![Products](https://github.com/user-attachments/assets/d1612405-05fb-4919-9f39-3322fe11d0cd)
![Sort By](https://github.com/user-attachments/assets/ca64dbf4-505b-4740-a907-b6f07b09de15)
![Products-1](https://github.com/user-attachments/assets/1794d48e-983c-4c84-b777-047a32255317)

### Cart

![Cart](https://github.com/user-attachments/assets/056d9d8e-58a6-4c80-b6c9-1b707a5f31df)


---

## 🚀 How to Run the Project  

### 1️⃣ Prerequisites  
- Install **Flutter** & **Dart**  
- Set up **Supabase** and configure your **API keys**  

### 2️⃣ Clone the Repository  
```sh
git clone https://github.com/1-abdelrahman-khalil-1/Fruits-Hub-App.git
cd Fruits-Hub-App
```
### 3️⃣ Install Dependencies  
```sh
flutter pub get
```
###3️⃣ Run the App
```sh
flutter run
```
