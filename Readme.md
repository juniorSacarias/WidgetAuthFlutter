# Widget Auth Flutter (Clean Architecture) 

![ahastudioLogo](https://github.com/user-attachments/assets/51f405c7-a81a-4dd7-af14-973b3521aea2)

**Author**: [Junior Sacarias](https://github.com/juniorSacarias)

---

## 📖 Introduction

Flutter Auth Widget is a project that implements a clean architecture for an authentication system in Flutter. This project is designed to be scalable, maintainable, and customizable, and provides a structured solution for managing authentication in Flutter applications.

The project organizes the code into clear layers, separating business logic, user interface, and infrastructure.

It started as a learning project but I leave it available and free to use for anyone interested.

---

## 🎥 Demo

Here’s a demo video showcasing the project in action:

https://github.com/user-attachments/assets/e8c91f5b-c4df-40c5-8e9e-892fc256344c

https://github.com/user-attachments/assets/c9cad7e6-278b-467c-8748-60cc9606cb78

---

## 📱 Responsive Design

The authentication system design is built to adapt to various screen sizes. Below are examples of how the design looks on different devices:

### Mobile
![Captura de pantalla de 2024-11-29 13-21-10](https://github.com/user-attachments/assets/07e356e8-6a3e-4d2f-9367-a6029639d19a)

### Tablet
![Captura de pantalla de 2024-11-29 13-22-02](https://github.com/user-attachments/assets/6e484cb3-4946-4f22-a63e-48781935ccef)

### Desktop
![Captura de pantalla de 2024-11-29 13-22-24](https://github.com/user-attachments/assets/1fa0984e-e1ff-40c1-a3fd-f1666a4953b4)


---

## 🛠️ Libraries Used

This project uses the following key libraries to ensure quality and performance:

- **[Flutter Bloc](https://pub.dev/packages/flutter_bloc)**: State management based on BLoC patterns.
- **[Dio](https://pub.dev/packages/dio)**: Powerful and easy-to-use HTTP client.
- **[Freezed](https://pub.dev/packages/freezed)**: Immutable class generation.
- **[Get It](https://pub.dev/packages/get_it)**: Dependency injection container.
- **[Equatable](https://pub.dev/packages/equatable)**: Simplified object comparison.
- **[Flutter Spinkit](https://pub.dev/packages/flutter_spinkit)**: Simplified load animations.
- **[Flutter SVG](https://pub.dev/packages/flutter_svg)**: Use SVG in Flutter.
- **[Elegant Notification](https://pub.dev/packages/elegant_notification)**: Beautiful notifications in Flutter:
- **[Go Router](https://pub.dev/packages/go_router)**: Simple router for flutter
---

## 🚀 Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/juniorSacarias/widget-auth-flutter.git
   cd widget-auth-flutter

2. **Install dependencies**:
   ```bash
   flutter pub get
3. ### 🌐 Configuration `.env` file

  Make sure to create a `.env` file in the project's assets folder with the following structure to define the necessary environment variables:
  
  ```env
  # Base URL of the API
  BASEURL=https://api.example.com
  
  # Specific endpoint ( server endpoint for logic of auth )
  ENDPOINT=/v1/authenticate

  # Specific endpoitn for clients ( New Version are available the posibility for can use diferent clients for the auth )
  ENDPOINTCLIENT = /v1/appClients

  # Specific default client ( New version are available the posibility for can define a default client )
  DEFAULT_CLIENT = thisisadefaultclientexample
