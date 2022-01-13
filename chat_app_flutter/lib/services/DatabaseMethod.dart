import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseMethod{
  GetUserByUserName(String UserName)async{
   return  await FirebaseFirestore.instance.collection("user").where("name",isEqualTo:UserName ).get();
  }
  UploadUserInfo(UserMap){
    FirebaseFirestore.instance.collection("user").add(UserMap);
  }
 CreateChatRoom(String ChatRoomId,ChatRoomMap){
    FirebaseFirestore.instance.collection('ChatRoom').doc(ChatRoomId).set(ChatRoomMap);
  }
}