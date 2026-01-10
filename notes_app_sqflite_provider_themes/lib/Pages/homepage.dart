import 'package:flutter/material.dart';
import 'package:notes_app_sqflite_provider_themes/Pages/addoreditscreen.dart';
import 'package:notes_app_sqflite_provider_themes/Providers/notesprovider.dart';
import 'package:notes_app_sqflite_provider_themes/Providers/themeprovider.dart';
import 'package:notes_app_sqflite_provider_themes/Services/notesmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotesProviderr = Provider.of<Notesprovider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        actions: [
          IconButton(onPressed: (){
            themeProvider.changeValue();
          }, icon: themeProvider.isDark ? Icon(Icons.dark_mode,color: Colors.white,):Icon(Icons.light_mode,color: Colors.black,))
        ],
      ),
      body: ListView.builder(
        itemCount: NotesProviderr.notesData.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddOrEditScreen(id: NotesProviderr.notesData[index].id, isSave: false,model: NotesModel(title: NotesProviderr.notesData[index].title,description: NotesProviderr.notesData[index].description),)));
              },
              title: Text(NotesProviderr.notesData[index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              subtitle: Text("Click to View or Edit"),
              trailing: CircleAvatar(
                backgroundColor: themeProvider.isDark ? Colors.deepPurple : Color.fromARGB(255, 217, 153, 228),
                child: IconButton(
                  onPressed: (){
                    NotesProviderr.deleteNotes(NotesModel(id: NotesProviderr.notesData[index].id));
                  }, icon: Icon(Icons.delete)),
              ),
            ),
          );
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddOrEditScreen(id: 0,isSave: true)));
        },
        child: Icon(Icons.note_add_sharp),),
    );
  }
}