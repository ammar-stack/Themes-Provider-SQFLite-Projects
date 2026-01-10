import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_themes/themeprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeproviders = Provider.of<Themeprovider>(context);
    final isLightt = themeproviders.isLightt;
    return Scaffold(
      appBar: AppBar(
        title: Text("Changing Themes"),
        actions: [
          IconButton(onPressed: (){
            themeproviders.changeMode();
          }, icon: Icon(isLightt == false ? Icons.light_mode_outlined : Icons.dark_mode_outlined))
        ],
      ),
    );
  }
}