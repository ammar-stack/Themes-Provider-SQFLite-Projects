import 'package:flutter/cupertino.dart';
import 'package:todo_app_sqflite_provider_themes/Services/dbhelper.dart';
import 'package:todo_app_sqflite_provider_themes/Services/todomodal.dart';

class Todoprovider extends ChangeNotifier{
  List<ToDoModal> todos = [];

  void getToDo() async{
    todos = await Dbhelper.instance.getToDo();
    notifyListeners();
  }

  void insertToDo(ToDoModal modal) async{
    await Dbhelper.instance.insertToDo(modal);
    getToDo();
  }

  void deleteToDo(ToDoModal modal) async{
    await Dbhelper.instance.deleteToDo(modal);
    getToDo();
  }


  void updateToDo(ToDoModal modal) async{
    await Dbhelper.instance.updateToDo(modal);
    getToDo();
  }
}