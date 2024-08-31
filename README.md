# Restaurant App

## Description

The **Restaurant App** is a simple Flutter application that loads restaurant data from a JSON file, displays the restaurant names in a list, and allows users to search for restaurants by name. The app is built using Flutter and Riverpod for state management.

## Features

- Load restaurant data from a local JSON file.
- Display a list of restaurants with their names and cuisines.
- Search functionality to filter restaurants by name.
- Uses Riverpod for efficient state management.

## Installation

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install) if you haven't already.
- A code editor like VS Code or Android Studio with Flutter and Dart plugins installed.

### Steps to Run the App

1. **Clone the Repository**

   ```bash
   git clone https://github.com/LucaXYB/restaurant_app.git
   cd restaurant_app
   ```

2. **Install Dependencies**
    - Run the following command to install all necessary dependencies: 
   ```bash
   flutter pub get
   ```

3. **Run the App**
    - You can run the app on an emulator, a connected device, or in the browser:

   ```bash
   flutter run
   ```
    - If you are using an emulator or a connected device, the app will launch there. If you want to run the app in the browser, you can select the web option when prompted. I recommend Chrome to run the app.

## How to Use the App

1. **Viewing the Restaurant List**
    - When the app starts, you will see a list of restaurants loaded from a JSON file.
    - Each item in the list displays the restaurant's name and cuisine.

2. **Searching for Restaurants**
    - At the top of the screen, you will find a search bar.
    - You can type in the search bar to filter the list of restaurants by their names.
    - The list updates in real-time as you type, showing only the restaurants that match your search query.

3. **Clearing the Search**
    - You can clear the search bar to view the full list of restaurants again.
    - Deleting characters from the search bar will dynamically update the list.