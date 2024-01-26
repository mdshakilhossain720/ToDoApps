import 'package:flutter/material.dart';
import 'package:todoapps/constants/color.dart';

import '../model/to_do_model.dart';
class ToDoItems extends StatelessWidget {
  final ToDo toDo;
  const ToDoItems({super.key, required this.toDo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        title: Text(toDo.todoText!,style: TextStyle(fontWeight: FontWeight.w300,color: blackColor,
            decoration:toDo.isDone?TextDecoration.lineThrough :null),),
        tileColor: Colors.white,
        leading: Icon(toDo.isDone?Icons.check_box:Icons.check_box_outline_blank),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: redColor,
            borderRadius: BorderRadius.circular(5),

          ),
          child: IconButton(onPressed: (){}, icon:Icon(Icons.delete)),
        ),
      ),
    );
  }
}
