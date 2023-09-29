import 'package:flutter/material.dart';
import 'package:taskmanager/Screen/task/cancelTasklistScreen.dart';
import 'package:taskmanager/Screen/task/completedTasklistScreen.dart';
import 'package:taskmanager/Screen/task/progressTasklistScreen.dart';
import 'package:taskmanager/Utility/Utility.dart';



class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {

  int bottamIndex=0;

  ontab(int index){
    setState(() {
      bottamIndex=index;
    });
  }

  final widgetOpitons=[
    NewTaskListScreen(),
    CompletedTaskListScreen(),
    CancelTaskListScreen(),
    ProgessTaskListScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: widgetOpitons.elementAt(bottamIndex),
      bottomNavigationBar: appButtomNav(bottamIndex,ontab),
    );
  }
}
