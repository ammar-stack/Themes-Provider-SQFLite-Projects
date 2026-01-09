import 'package:flutter/material.dart';
import 'package:practise_flutter_themes/themeprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeproviderr = Provider.of<Themeprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('abc'),
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        themeproviderr.changeTheme();
      }, child: themeproviderr.isLight == true ? Text('Change to Dark'):Text('Change to Light'))),
    );
  }
}