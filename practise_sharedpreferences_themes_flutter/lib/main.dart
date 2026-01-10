import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_themes/homepage.dart';
import 'package:shared_preference_themes/themeprovider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Themeprovider()..checkMode())
      ],
      child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Themeprovider>(context);
    bool isLightt = providerData.isLightt;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: isLightt ? ThemeMode.light:ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueAccent,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.black),
        )
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
          elevation: 5,
          iconTheme: IconThemeData(color: Colors.white),
        )
      ),
      home: const HomePage()
    );
  }
 
}
