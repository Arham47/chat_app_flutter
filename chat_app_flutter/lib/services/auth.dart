import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class AuthMethod{

  final FirebaseAuth _auth=FirebaseAuth.instance;

  Future SignInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      final User? user=_auth.currentUser;
      if(user!=null){
          print(user.uid);
        return user.uid;

      }else{
        return  null;
      }


      return  ;
    }catch(e){
      print(e.toString());
    }

  }
Future SignUpWithEmailAndPassword(String email,String password)async{
  try{
    UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final User? user=_auth.currentUser;
    if(user!=null){


      return user.uid;


    }else{

      return  null;
    }


    return  ;
  }catch(e){
    toastMessage(e.toString());
    print(e.toString());
  }


}
Future ResetPassword(String email)async{

    try{

       return await _auth.sendPasswordResetEmail(email: email);

    }catch(e){
     return  print(e.toString());
    }
}
Future Signout()async{
    try{
      return _auth.signOut();

    }catch(e){

      print(e.toString());
    }
}

  void toastMessage(String mesg) {

     Fluttertoast.showToast(
          msg: mesg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
  }
}

