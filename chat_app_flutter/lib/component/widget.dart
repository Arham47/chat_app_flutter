import 'package:flutter/material.dart';

Widget AppBarMain(BuildContext context){
  return AppBar(
    title: Image.asset("asset/image/logo.png",height: 50,),
  );
}
InputDecoration TextFieldInputDecoration(String Text){
  return InputDecoration(
      hintText: "email",
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

  );

}
TextStyle TextFieldStyle(){
  return TextStyle(

  );
}