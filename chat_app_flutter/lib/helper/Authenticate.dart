import 'package:chat_app_flutter/views/SignIn.dart';
import 'package:chat_app_flutter/views/SignUp.dart';
import 'package:flutter/material.dart';
class Autheneticatee extends StatefulWidget {
  const Autheneticatee({Key? key}) : super(key: key);

  @override
  _AutheneticateeState createState() => _AutheneticateeState();
}

class _AutheneticateeState extends State<Autheneticatee> {
  bool ShowSignIn=false;
  void toggle(){
    setState(() {
      ShowSignIn=!ShowSignIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(ShowSignIn){
      return SignIn(toggle);
    }else{
      return SignUp(toggle);
    }

  }
}
