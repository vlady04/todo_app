import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening the app

  void createInitialdata(){
     //List<List<dynamic>> 
     toDoList = [
      ["alimentar a Stella", false],
      ["no dejar que ofelia te coma", false],
    ];
  }

  //load the data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase(){
    _myBox.put("TODOLIST", toDoList);
  }

}