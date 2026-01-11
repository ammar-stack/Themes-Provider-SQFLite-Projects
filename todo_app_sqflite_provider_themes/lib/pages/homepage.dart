import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_sqflite_provider_themes/Services/todomodal.dart';
import 'package:todo_app_sqflite_provider_themes/providers/themeprovider.dart';
import 'package:todo_app_sqflite_provider_themes/providers/todoprovider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoprovider = Provider.of<Todoprovider>(context);
    final themeprovider = Provider.of<Themeprovider>(context);
    TextEditingController todocontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Text("To Do",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),Text('s',style: TextStyle(fontSize: 30),)],),
        actions: [
          IconButton(onPressed: (){
            themeprovider.changeMode();
          }, icon: Icon(themeprovider.isLight ? Icons.light_mode_sharp : Icons.dark_mode_sharp))
        ],
      ),
      body: ListView.builder(
        itemCount: todoprovider.todos.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
            title: Text(todoprovider.todos[index].todo.toString(),style: TextStyle(decoration:todoprovider.todos[index].isDone == 1 ? TextDecoration.lineThrough : TextDecoration.none,fontSize: 23,fontWeight: FontWeight.bold),),
            subtitle: Text("Click to Edit"),
            onLongPress: () => todoprovider.deleteToDo(ToDoModal(id: todoprovider.todos[index].id)),
            trailing: Checkbox(
              checkColor: themeprovider.isLight ? Colors.black : Colors.cyanAccent,
              side: themeprovider.isLight ? BorderSide(color: Colors.cyanAccent,width: 2) : BorderSide(color: Colors.cyan.shade900,width: 2),
              activeColor: themeprovider.isLight ? Colors.cyanAccent : Colors.cyan.shade900,
              value: todoprovider.todos[index].isDone == 0 ? false : true, onChanged: (value){
                todoprovider.updateToDo(ToDoModal(id: todoprovider.todos[index].id,todo: todoprovider.todos[index].todo,isDone: !value! ? 0 : 1));
              }),
            onTap: () {
              todocontroller.text = todoprovider.todos[index].todo.toString();
              showModalBottomSheet(context: context, builder: (context){
            return Container(
              height: 200,
              color: themeprovider.isLight ? Colors.cyan.shade900 : Colors.cyanAccent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: TextField(
                      controller: todocontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Edit To Do'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: (){
                        todoprovider.updateToDo(ToDoModal(todo: todocontroller.text,isDone: todoprovider.todos[index].isDone,id: todoprovider.todos[index].id));
                        todocontroller.clear();
                        Navigator.pop(context);
                      }, child: Text("Edit To Do")),
                  )
                ],
              ),
            );
          });
            },
          ));
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return Container(
              height: 200,
              color:  themeprovider.isLight ? Colors.cyan.shade900 : Colors.cyanAccent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                    child: TextField(
                      style:Theme.of(context).textTheme.bodyMedium,
                      controller: todocontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter To Do',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: (){
                        todoprovider.insertToDo(ToDoModal(todo: todocontroller.text,isDone: 0));
                        todocontroller.clear();
                        Navigator.pop(context);
                      }, child: Text("Add To Do")),
                  )
                ],
              ),
            );
          });
          todocontroller.clear();
        },
        
        child: Icon(Icons.add_task_sharp),),
    );
  }
}