import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider_themes/Pages/homepage.dart';
import 'package:notes_app_sqflite_provider_themes/Providers/notesprovider.dart';
import 'package:notes_app_sqflite_provider_themes/Providers/themeprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Notesprovider()..getNotes()),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp(

      themeMode: providerTheme.isDark ? ThemeMode.dark : ThemeMode.light,
      //light theme
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 217, 153, 228),
          titleTextStyle: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
        ),

        scaffoldBackgroundColor: const Color.fromARGB(255, 217, 153, 228),
        cardTheme: CardThemeData(
          color: Colors.deepPurple, 
        ),
      
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white
          )
        ),
        listTileTheme: ListTileThemeData(
          textColor: Colors.white,
          iconColor: Color.fromARGB(255, 165, 15, 5),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Color.fromARGB(255, 217, 153, 228),
          elevation: 0
        )
      ),

      //dark theme
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 217, 153, 228),
            foregroundColor: Colors.black
          )
        ),
        inputDecorationTheme: InputDecorationThemeData(
          focusColor: Colors.white,
          hintStyle: TextStyle(color: const Color.fromARGB(255, 217, 153, 228)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 217, 153, 228))
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 217, 153, 228))
          )
        ),
        cardTheme: CardThemeData(
          color: const Color.fromARGB(255, 217, 153, 228), 
        ),
        listTileTheme: ListTileThemeData(
          textColor: Colors.black,
          iconColor: const Color.fromARGB(255, 253, 34, 18),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromARGB(255, 217, 153, 228),
          foregroundColor: Colors.deepPurple,
          elevation: 0
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
