import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/Style/Style.dart';

Future<void> StoreUserdata(Userdata) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', Userdata['token']);
  await prefs.setString('email', Userdata['data']['email']);
  await prefs.setString('firstName', Userdata['data']['firstName']);
  await prefs.setString('lastName', Userdata['data']['lastName']);
  await prefs.setString('mobile', Userdata['data']['mobile']);
  await prefs.setString('photo', Userdata['data']['photo']);
}

Future<void>WriteEmailVerification(Email)async {
final prefs = await SharedPreferences.getInstance();
await prefs.setString('EmailVerification', Email);
}

Future<void>WriteOTPVerification(OTP)async {
final prefs = await SharedPreferences.getInstance();
await prefs.setString('OTBVerification', OTP);
}

Future<String?> ReadUserdata(Key) async {
  final prefs = await SharedPreferences.getInstance();
String? mydata =await prefs.getString(Key);
return mydata;
}

BottomNavigationBar appButtomNav(currentIndex,ontab){
  return BottomNavigationBar(items: [
    BottomNavigationBarItem(
        icon: Icon(Icons.list_alt_outlined),
      label: "New Task",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_outlined),
      label: "Completed",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_outlined),
      label: "Canceled",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_alt_outlined),
      label: "Progress",
    ),
  ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGrey,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: ontab,
    type: BottomNavigationBarType.fixed,

  );
}
