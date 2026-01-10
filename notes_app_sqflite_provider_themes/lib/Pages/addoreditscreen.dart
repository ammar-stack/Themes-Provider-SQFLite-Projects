import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider_themes/Pages/addoreditscreen.dart';
import 'package:notes_app_sqflite_provider_themes/Providers/notesprovider.dart';
import 'package:notes_app_sqflite_provider_themes/Services/notesmodel.dart';
import 'package:provider/provider.dart';

class AddOrEditScreen extends StatelessWidget {
  bool isSave;
  int? id;
  NotesModel? model;
   AddOrEditScreen({this.model,required this.id,required this.isSave,super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: isSave ? '':model?.title.toString());
    TextEditingController descriptionController = TextEditingController(text: isSave ? '' : model?.description.toString());
    final providerClass = Provider.of<Notesprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(isSave ? "Add Notes":"Edit Notes"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.light_mode))
        ],
      ),
      
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Enter Title',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                maxLines: 8,
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  if(titleController.text != '' && descriptionController.text != ''){
                    if(isSave){
                      providerClass.insertNotes(NotesModel(title: titleController.text,description: descriptionController.text));
                      titleController.clear();
                      descriptionController.clear();
                      Navigator.pop(context);
                    }
                    else{
                      providerClass.updateNotes(NotesModel(id: id,title: titleController.text,description: descriptionController.text));
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                    }
                  }
                  else{
                    
                  }
                }, child: Text(isSave ? 'Save' : 'Edit'))
            ],
          ),
        ),
    );
  }
}