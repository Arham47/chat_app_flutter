import 'package:chat_app_flutter/helper/Authenticate.dart';
import 'package:chat_app_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import '';
import 'SearchRoom.dart';
import 'SignIn.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("asset/image/logo.png",height: 50,),
        actions: [
          GestureDetector(
            onTap: (){
              AuthMethod auth= new AuthMethod();
              auth.Signout();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Autheneticatee()));

            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app),

            ),
          )
        ],


      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchRoom()));
        },
      ),

      body: Container(),
    );
  }
}
