
import 'package:flutter/material.dart';
import '../../Rest_API/ApiClint.dart';
import '../../Style/Style.dart';

class registrationScreen extends StatefulWidget {
   registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

  Map<String,String> FormValues={"email":"", "firstName":"", "lastName":"", "mobile":"", "password":"", "photo":"","cpassword":""};
  bool Loading =false;

  InputOnChange(Mapkey , Textvalue){
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {

    if(FormValues['email']!.length==0){
      ErrorToast('Email Required!');
    }
    else if(FormValues['firstName']!.length==0){
      ErrorToast('FirstName Required!');
    }
    else if(FormValues['lastName']!.length==0){
      ErrorToast('LastName Required!');
    }
    else if(FormValues['mobile']!.length==0){
      ErrorToast('Mobile no Required!');
    }
    else if(FormValues['password']!.length==0){
      ErrorToast('Password Required!');
    }
    else if(FormValues['password']!=FormValues['cpassword']){
      ErrorToast('Confirm Password should be same!');
    }
    else{
      setState(() {Loading=true;});

      bool res=await RegistrationRequest(FormValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
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
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 30),
            child:  Container(
              alignment: Alignment.center,
              child: Loading?(Center(child: CircularProgressIndicator())):(
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                    padding: EdgeInsets.all(30),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Join With Us",style: Head1Text(colorDarkBlue)),
                        SizedBox(height: 1),
                        Text("Learn With Hasan",style: Head6Text(colorLightGrey)),
                        SizedBox(height: 20),
                        TextFormField(decoration: AppInputDecoration("Email Address"),
                          onChanged: (Textvalue){
                            InputOnChange("email", Textvalue);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(decoration: AppInputDecoration("First Name"),
                          onChanged: (Textvalue){
                            InputOnChange("firstName", Textvalue);
                          },

                        ),

                        SizedBox(height: 20),
                        TextFormField(decoration: AppInputDecoration("Last Name"),
                          onChanged: (Textvalue){
                            InputOnChange("lastName", Textvalue);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(decoration: AppInputDecoration("Mobile"),
                          onChanged: (Textvalue){
                            InputOnChange("mobile", Textvalue);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(decoration: AppInputDecoration("Password"),
                          onChanged: (Textvalue){
                            InputOnChange("password", Textvalue);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(decoration: AppInputDecoration("Confirm Password"),
                          onChanged: (Textvalue){
                            InputOnChange("cpassword", Textvalue);
                          },
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: AppButtonStyle(),
                            child: SuccessButtonChild('Registration'),
                            onPressed: (){
                              FormOnSubmit();
                            },
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          )

        ],
      ),
    );
  }
}
