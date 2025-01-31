# Financial Report App
- This app is designed to provide insights into order data through two main screens: Metrics Screen and Graph Screen. It helps users analyze order trends, performance, and key metrics in a visually intuitive way.
- ### Features
    * ##### Metrics Screen:
        * Displays numeric insights about orders, including:
            * Total Order Count: The total number of orders placed.
            * Average Order Price: The average price of all orders.
            * Total Number of Returned Orders: The total number of orders that were returned.
              [![Metrics screen](https://raw.githubusercontent.com/youssefhedefa/financial_report_app/refs/heads/main/screen_shots/mobile/Screenshot_20250106_181203.png "Metrics screen")](https://raw.githubusercontent.com/youssefhedefa/financial_report_app/refs/heads/main/screen_shots/mobile/Screenshot_20250106_181203.png "Metrics screen")
    * ##### Graph Screen
        * Displays a graph visualizing order trends over time:
            * Y-axis: Represents the number of orders.
            * X-axis: Represents time (order dates).
              [![Number of orders per day](https://github.com/youssefhedefa/financial_report_app/blob/main/screen_shots/mobile/Screenshot_20250106_181224.png?raw=true "Number of orders per day")](https://github.com/youssefhedefa/financial_report_app/blob/main/screen_shots/mobile/Screenshot_20250106_181224.png?raw=true "Number of orders per day")

          [![Number of orders per month](https://github.com/youssefhedefa/financial_report_app/blob/main/screen_shots/mobile/Screenshot_20250106_181236.png?raw=true "Number of orders per month")](https://github.com/youssefhedefa/financial_report_app/blob/main/screen_shots/mobile/Screenshot_20250106_181236.png?raw=true "Number of orders per month")

## How to run the app
- #####  To run the application, follow these steps:
    - **Clone the repository**:
        - git clone https://github.com/youssefhedefa/financial_report_app
    -  cd financial_report_app
    - **Install Flutter**:
        - If you don't have Flutter installed, follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install "official Flutter installation guide").
    - **Install dependencies**:
        - Run the following command to install all required dependencies:
            - flutter pub get
    - **Run the app**:
      -Connect a physical device or start an emulator.
        - Run the app using the following command:
            - flutter run
    - **Access the app**:
        - The app will launch on your connected device or emulator.
        - You can now interact with the Metrics Screen and Graph Screen.
    - **Additional Notes**:
        - Ensure you have at latest 3.24.3 version of Flutter installed.


## Packages used
- **flutter_bloc** : A state management library that implements the BLoC (Business Logic Component) pattern. It helps separate business logic from the UI, making the app more maintainable and testable.
- ** bloc**: The core library for implementing the BLoC pattern. It provides the foundational classes for creating and managing BLoCs, Works alongside flutter_bloc to define events, states, and business logic
- **getIt**:  A service locator for dependency injection. It helps manage and access dependencies in a clean and efficient way
- **syncfusion_flutter_charts**: A powerful charting library for creating visually appealing and interactive charts in Flutter.

## Assumptions made during development
- **User Experience**: Create a bottom nav bar to make it easy for the user to navigate.
- **Performance**: The app will perform well even with complex charts and frequent state updates, thanks to the efficiency of the BLoC pattern and Syncfusion's optimized chart rendering
- **Platform Compatibility**: The app will primarily target mobile platforms (iOS and Android) and the web, so the chosen packages are compatible with them.
- **Scalability**: The app will scale over time, with new features and increased complexity in state management and data handling