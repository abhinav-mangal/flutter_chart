import 'package:flutter/material.dart';
import 'package:flutter_charts/controller.dart';
import 'package:flutter_charts/home_page.dart';
import 'package:provider/provider.dart';

/// The entry point of the application.
///
/// This function initializes the app by creating a [ChangeNotifierProvider]
/// widget that wraps the [MyApp] widget. The [ChangeNotifierProvider] widget
/// creates a [PriceHistoryProvider] and provides it to the widget tree. The
/// [PriceHistoryProvider] is responsible for managing the price history data
/// and updating it periodically.
///
/// The [create] parameter of [ChangeNotifierProvider] is a callback function
/// that creates a new instance of [PriceHistoryProvider].
///
/// The [child] parameter of [ChangeNotifierProvider] is the root widget of
/// the widget tree.
void main() {
  runApp(
    // Create a ChangeNotifierProvider widget.
    ChangeNotifierProvider(
      // Create a new instance of PriceHistoryProvider.
      create: (context) => PriceHistoryProvider(),
      
      // Set the root widget of the widget tree to MyApp.
      child: const MyApp(),
    ),
  );
}

// Define the main application widget.
class MyApp extends StatelessWidget {
  // The constructor for MyApp.
  const MyApp({super.key});

  // Builds the widget tree for the app.
  //
  // This function builds a [MaterialApp] widget with a title, theme, and a
  // [HomePage] widget as the root widget of the widget tree.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set the title of the app.
      title: 'Flutter Demo',
      // Set the theme for the app.
      theme: ThemeData(
        // Create a color scheme from a seed color.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // Enable Material 3 design.
        useMaterial3: true,
      ),
      // Set the root widget of the widget tree to HomePage.
      home: const HomePage(),
    );
  }
}
