import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_sqflite_provider_themes/pages/homepage.dart';
import 'package:todo_app_sqflite_provider_themes/providers/themeprovider.dart';
import 'package:todo_app_sqflite_provider_themes/providers/todoprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Todoprovider()..getToDo()),
        ChangeNotifierProvider(create: (_) => Themeprovider())
      ],
      child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<Themeprovider>(context);
    return MaterialApp(
      themeMode: themeProvider.isLight ? ThemeMode.light : ThemeMode.dark,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.cyanAccent)
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.cyanAccent),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.cyanAccent)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.cyan.shade900,
            
          )
        ),
        scaffoldBackgroundColor: Colors.cyanAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyanAccent,
          titleTextStyle: TextStyle(color: Colors.cyan.shade900),
          actionsIconTheme: IconThemeData(color: Colors.cyan.shade900),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.cyan.shade900,
          textColor: Colors.cyanAccent,),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.cyan.shade900,
          foregroundColor: Colors.cyanAccent
        )
      ),
      darkTheme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.cyan.shade900)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan.shade900,
            foregroundColor: Colors.cyanAccent
          )
        ),
        scaffoldBackgroundColor: Colors.cyan.shade900,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan.shade900,
          titleTextStyle: TextStyle(color: Colors.cyanAccent),
          actionsIconTheme: IconThemeData(color: Colors.cyanAccent),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: Colors.cyanAccent,
          textColor: Colors.cyan.shade900,),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.cyanAccent,
          foregroundColor: Colors.cyan.shade900
        )
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
