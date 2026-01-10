import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider_themes/Services/dbhelper.dart';
import 'package:notes_app_sqflite_provider_themes/Services/notesmodel.dart';

class Notesprovider extends ChangeNotifier{
  List<NotesModel> notesData = [];

  void getNotes() async{
    notesData = await Dbhelper.instance.getNotes();
    notifyListeners();
  }

  void insertNotes(NotesModel model) async{
    await Dbhelper.instance.insertNotes(model);
    getNotes();
  }

  void deleteNotes(NotesModel model) async{
    await Dbhelper.instance.deleteNotes(model);
    getNotes();
  }

  void updateNotes(NotesModel model) async{
    await Dbhelper.instance.updateNotes(model);
    getNotes();
  }
}