import 'package:flutter/material.dart';
import 'package:taskmanager/Screen/bording/VerficationPinScreen.dart';
import 'package:taskmanager/Screen/bording/emailVerificationScreen.dart';
import 'package:taskmanager/Screen/bording/loginScreen.dart';
import 'package:taskmanager/Screen/bording/registrationScreen.dart';
import 'package:taskmanager/Screen/bording/setPasswordScreen.dart';
import 'package:taskmanager/Screen/bording/splashScreen.dart';
import 'package:taskmanager/Screen/task/newTasklistScreen.dart';


// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
// String? token =await  ReadUserdata('token');
// if(token==null){
//   runApp( MyApp("/login"));
// }
// else{
//   runApp( MyApp("/newTaskList"));
// }
//
// }

void main(){
  runApp(MyApp('/login'));

}

class MyApp extends StatelessWidget {
  final String FirstRoute;
   MyApp(this.FirstRoute);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "Task Manager",
      initialRoute: '/login',
      routes: {
       '/':(context)=>splashScreen(),
        '/login':(context)=>loginScreen(),
        '/registration':(context)=>registrationScreen(),
        '/email':(context)=>emailVerificationScreen(),
        '/pinVerification':(context)=>pinVerificationScreen(),
        '/setPassword':(context)=>setPasswordScreen(),
        '/newTaskList':(context)=>NewTaskListScreen(),

      }
    );
  }
}

