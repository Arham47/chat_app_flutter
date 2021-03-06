import 'package:chat_app_flutter/helper/Authenticate.dart';
import 'package:chat_app_flutter/views/SearchRoom.dart';
import 'package:chat_app_flutter/views/SignIn.dart';
import 'package:chat_app_flutter/views/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F ),
        primaryColor: Color(0xff145C9E),

        primarySwatch: Colors.blue,
      ),
      home: SearchRoom(),
    );
  }
}


