import 'package:chat_app_flutter/component/widget.dart';
import 'package:chat_app_flutter/services/DatabaseMethod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchRoom extends StatefulWidget {
  const SearchRoom({Key? key}) : super(key: key);

  @override
  _SearchRoomState createState() => _SearchRoomState();
}

class _SearchRoomState extends State<SearchRoom> {
  TextEditingController SearchController= new TextEditingController();
  DataBaseMethod method=new DataBaseMethod();
   QuerySnapshot? SearchSnapShot;
  bool LoadingSpinner=false;
    initiateSearch(){
return  method.GetUserByUserName(SearchController.text).then((val){
  print("$val");

  setState(() {
    SearchSnapShot=val;
    LoadingSpinner=true;
    SearchWidget();

  });

});
  }
  CreateChatRoomAndStartConversationScreen(){

  }
  Widget SearchWidget(){





     if(SearchSnapShot!=null){
       setState(() {
         LoadingSpinner=false;
       });
       return ListView.builder(
      itemCount:SearchSnapShot?.docs.length ,
        shrinkWrap: true,
        itemBuilder: (context,index){
        return SearchTile(
          userName: SearchSnapShot?.docs[index]["name"],
          email: SearchSnapShot?.docs[index]['email'],
        );
        }

    );}else{
       setState(() {
         LoadingSpinner=false;
       });

       return Container();}
  }
  @override
  Widget build(BuildContext context) {
    return LoadingSpinner?Container(
        child: Center(child: CircularProgressIndicator()),
    ) :Scaffold(
      appBar: AppBar(
        title: Image.asset("asset/image/logo.png",height: 50,)
      ),
      body: Column(
        children: [
          Container(
            color: Color(0x54FFFFFF),
            padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),

            child: Row(
             children: [
              Expanded(child:  TextField(
                controller: SearchController,
                style: TextStyle(
                  color: Colors.white
                ),

                decoration: TextFieldInputDecoration("search "),
              )),

               GestureDetector(
                 onTap: (){
initiateSearch();

                 },
                 child: Container(
                   height: 40,
                     width: 40,
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                        colors: [
                          const Color(0x36FFFFFF),
                          const Color(0xFFFFFFFF),

                        ]

                       ),
                      borderRadius: BorderRadius.circular(40),

                     ),

                     padding: EdgeInsets.all(12),

                     child: Icon(Icons.search),

                 ),
               )


             ],

            ),
          ),

          SearchWidget(),


        ],
      ),

    );
  }
  
}
class SearchTile extends StatelessWidget {
  final String email;
  final String userName;
   SearchTile({required this.userName,required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0,horizontal: 10),
      child: Container(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                 Text(userName,style:TextStyle(color: Colors.white, )),
                  Text(email,style:TextStyle(color: Colors.white) )
          ],

              ),
            ),
            Spacer(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(30),
                color: Colors.blue


              ),
              child: Text("message",style: TextStyle(color:Colors.white,)),
            )
          ],
        ),
      ),
    );
  }
}

