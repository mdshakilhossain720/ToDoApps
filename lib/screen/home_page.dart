import 'package:flutter/material.dart';
import 'package:todoapps/constants/color.dart';
import 'package:todoapps/model/to_do_model.dart';

import '../widgets/to_do_item.dart';
class HomePage extends StatelessWidget {
   HomePage({super.key});
  final todolist=ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(),

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,bottom: 20,

                        ),
                        child: Text("ALL ToDo",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),

                      ),
                      for(ToDo todo in todolist)
                        ToDoItems(toDo: todo,),


                    ],
                  ),
                )
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    //controller: _todoController,
                    decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                   // _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: blueColor,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),


        ],
      ),
    );
  }

  Container searchBox() {
    return Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

          ),
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search,color: blackColor,size: 20,),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 25,
                minHeight: 20,
              ),
              border: InputBorder.none,
              hintText: 'Search',
              helperStyle: TextStyle(color: greyColor),

            ),
          ),
        );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: bgColor,
        title: Row(
      children: [
        Icon(Icons.menu,color: bgColor,size: 30,),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/image/avatar.jpg"),
          ),

        ),
      ],
    ));
  }
}
