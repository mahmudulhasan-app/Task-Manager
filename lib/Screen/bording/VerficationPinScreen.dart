import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/Rest_API/ApiClint.dart';
import 'package:taskmanager/Style/Style.dart';
import 'package:taskmanager/Utility/Utility.dart';

class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {

  Map<String,String> FormValues={"otb":""};
  bool Loading=false;

  InputOnChange(Mapkey , Textvalue){
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }
  FormOnSubmit() async{
    if(FormValues['otb']!.length==0){
      ErrorToast('PIN Required !');
    }
    else{
      setState(() {Loading =true;});
      String? emailAdress=await ReadUserdata('EmailVerification');
      bool res =await VerifyOTPRequest(emailAdress,FormValues['otb']);
      if(res==true){
        Navigator.pushNamed(context, "/setPassword");
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
                Text("PIN Verification",style: Head1Text(colorDarkBlue),),
                SizedBox(height: 10),
                Text("A 6 digit verification pin will send to youremail address",style: Head6Text(colorLightGrey),),
                SizedBox(height: 20,),
                PinCodeTextField(
                    appContext: context,
                    length: 6,
                  pinTheme: AppOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v){

                  },
                  onChanged: (value){

                  },
                ),
   Container(
  child: ElevatedButton(
    style: AppButtonStyle(),
    child: SuccessButtonChild('Verify'),
    onPressed: (){
      FormOnSubmit();
    },
  ),
)
              ],
            ),
          )
        ],
      ),
    );
  }
}
