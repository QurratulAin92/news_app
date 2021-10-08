import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:e_commerce/home.dart';
import 'package:e_commerce/post.dart';
import 'package:e_commerce/main.dart';

//  void post(BuildContext context){
//      Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (BuildContext context) => Post(),
//               ));
// }

  
  
void imagePick ()async{

     //image picker code for web
      Image fromPicker = await ImagePickerWeb.getImage(outputType: ImageType.file);
  
      //image picker code for mobile
      final ImagePicker imagePicker = ImagePicker();
      final  image = await imagePicker.getImage(source: ImageSource.gallery);
  }


  class Profile extends StatelessWidget {
 
   
    @override
    Widget build(BuildContext context) {
      final TextEditingController usernameController = TextEditingController();
      final TextEditingController emailController = TextEditingController();
       final TextEditingController addressController = TextEditingController();
        FirebaseFirestore db = FirebaseFirestore.instance;

      void profile()async{
           
            final String username = usernameController.text;
            final String email = emailController.text;
            final String address = addressController.text;
      

       try{
     
      db.collection("userData").doc("data").set({
          "email":email,
        "username":username,
        "address":address,
      }); 
   


         showDialog(context: context, builder:(BuildContext context){
        return AlertDialog(content: Text("Congratulation! Your Account is created. You are Registered Now"),);}
       
         );}
    catch(e){
      print(e);


      showDialog(context: context, builder:(BuildContext context){
        return AlertDialog(content: Text(e.message),);
      }
      );
    }
   }



      return MaterialApp(
            home: Scaffold(
                          body: Container(
          child: SafeArea(
                child:SingleChildScrollView(
                                  child: Column(
                    children:[
                        Container(
                              width: 700,
                             height: 60,
                         
                          child: Text("News Application",
                         style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 40)),
                         
                         color:Colors.indigo[900]),
                         SizedBox(height:10),
                      TextFormField(
                        controller: usernameController,
                        decoration:InputDecoration(
                          labelText:"Enter Username"
                        )
                      ),
                      SizedBox(height:10),
                       TextFormField(
                        controller: emailController,
                        decoration:InputDecoration(
                          labelText:"Enter Email"
                        )
                      ),
                      SizedBox(height:10),
                       TextFormField(
                        controller: addressController,
                        decoration:InputDecoration(
                          labelText:"Enter Address"
                        )
                      ),
                      SizedBox(height:10),
                    
                      Container(color:Colors.amber,
                        child: ElevatedButton( onPressed: imagePick, child: Text("Pick Your Image",   style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 30))),
                      ),

                   
                          SizedBox(height:10),
                      Container(color:Colors.amber,
                        child: ElevatedButton( onPressed: profile, child: Text("Create Your Account",   style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 30))),
                      ),
                      Container(
                      
                      //  ElevatedButton( onPressed: post, child: Text("SignIn",   style: TextStyle(
                      //      color: Colors.white,
                      //      fontWeight: FontWeight.bold,
                      //      fontSize: 30))),

                      
                     
                      )]
                  ),
                )
              
          ),
        ),
            ),
      );
    }
  }