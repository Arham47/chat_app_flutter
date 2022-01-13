
import 'dart:ui';

import 'package:chat_app_flutter/component/widget.dart';
import 'package:chat_app_flutter/services/auth.dart';
import 'package:flutter/material.dart';

import 'ChatRoom.dart';
class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn(this.toggle);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController EmailNameController=TextEditingController();
  TextEditingController PasswordNameController=TextEditingController();
  AuthMethod method=new AuthMethod();
  final _formKey=GlobalKey<FormState>();
 bool LoadingSpinner=false;
  SignIn(){
    if(_formKey.currentState!.validate()){
      method.SignUpWithEmailAndPassword(EmailNameController.text, PasswordNameController.text).then((val){

        setState(() {
          LoadingSpinner=true;
        });


        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context)=>ChatRoom()
        ));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("asset/image/logo.png",height: 50,),

        ),
      body:LoadingSpinner?Container(
        child: Center(child: CircularProgressIndicator()),
      ): Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (val){
                  return  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!)?null:"Enter correct email";
                },
                controller: EmailNameController,
                style: TextFieldStyle(),
                decoration: TextFieldInputDecoration("Email"),

              ),
              TextFormField(
                validator: (val){
                  return val!.length>6?null:"please enter strong password";
                },
                obscureText: true,
                controller: PasswordNameController,
                style: TextFieldStyle(),
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white
                    )
                  )

                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Text("Forgot Password",style: TextFieldStyle(),),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                       gradient:LinearGradient(
                      colors: [const Color(0xff007EF4),
                      const Color(0xff2A75BC)]

                )  ),
                child: Text("Sign In",style:TextStyle(
                  color: Colors.white,
                  fontSize: 17
                )
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white ),
                child: Text("Signin With Google !",style:TextStyle(
                    color: Colors.black,
                    fontSize: 17
                )
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",style: TextStyle(
                      color: Colors.white,


                  ),),
                  GestureDetector(
                    onTap: (){
                      widget.toggle;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("Register now!",style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline
                      ),),
                    ),
                  )


                ],
              )

              ,
              SizedBox(
                height: 50,
              )

            ],

          ),
        ),

      ),
    );
  }
}
