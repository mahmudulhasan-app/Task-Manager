import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Rest_API/ApiClint.dart';
import 'package:taskmanager/Style/Style.dart';
class loginScreen extends StatefulWidget {
   loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  Map<String,String> FormValues={"email":"","password":"",};
  bool Loading=false;
  InputOnChange(Mapkey , Textvalue){
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async{
    if(FormValues['email']!.length==0){
      ErrorToast('Email Required !');
    }
    else if(FormValues['password']!.length==0){
      ErrorToast('Password Required !');
    }
    else{
      setState(() {Loading=true;});

     bool res=await LoginRequest(FormValues);
     if(res==true){
          Navigator.pushNamedAndRemoveUntil(context, "/newTaskList", (route) => false);
     }
     else{
       setState(() {Loading=false;});
     }
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started With",style: Head1Text(colorDarkBlue)),

                    SizedBox(height: 1,),

                Text("Learn With Hasan",style: Head6Text(colorLightGrey)),

                SizedBox(height: 20),

                TextFormField(
                  onChanged: (TextValue){
                    InputOnChange("email",TextValue);
                  },
                  decoration:AppInputDecoration("Email Address"),
                ),

                SizedBox(height: 20),

                TextFormField(

                    onChanged: (TextValue){
                      InputOnChange("password",TextValue);
                    },
                    decoration: AppInputDecoration("Password",

                    ),
                ),
                SizedBox(height: 20),

                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Login'),
                    onPressed: (){
              FormOnSubmit();
                    },
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      InkWell(
                        onTap:(){
                          Navigator.pushNamed(context, "/email");
                        },
                        child: Text('Forget Password?',style: Head6Text(colorLightGrey),),
                      ),
          SizedBox(height: 15),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, "/registration");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have a account? ",style: Head6Text(colorDarkBlue),),
                            Text("Sign Up",style: Head6Text(colorGreen),)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
