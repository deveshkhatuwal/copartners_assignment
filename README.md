This Flutter application displays expert subscription details fetched from an API. It organizes and displays data using tabs for different service types.

Features
Fetch and display expert subscription details from an API.
Organize data by service types: Options, Equity, and Commodity.
Display expert details including image, rating, experience, and contact information.
Show subscription plans and pricing.
Getting Started
Prerequisites
Flutter SDK: Install Flutter
A text editor or IDE: Android Studio or Visual Studio Code
lib/
├── main.dart               # Entry point of the application
├── models/
│   └── expert.dart         # Expert model combining expert details and subscription
├── providers/
│   └── tab_provider.dart   # Provider for managing tab data and state 
    └── expert_provider.dart   # Provider for managing expert data and state
├── screens/
│   └── home_screen.dart    # Main screen displaying expert data
└── widgets/
└── expert_card.dart    # Widget for displaying individual expert details