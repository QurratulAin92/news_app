import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/home.dart';



import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
  ;
   void register()async{
     FirebaseAuth auth = FirebaseAuth.instance;
     FirebaseFirestore db = FirebaseFirestore.instance;
     final String username = usernameController.text;
     final String email = emailController.text;
     final String password = passwordController.text;
   
     
    try{
      final UserCredential user = await auth.createUserWithEmailAndPassword(email:email,password:password);
      db.collection("users").doc(user.user.uid).set({
        "email":email,
        "username":username,
      }); 
     final DocumentSnapshot snapshot = await db.collection("users").doc(user.user.uid).get();
     final data = snapshot.data();


        //  showDialog(context: context, builder:(BuildContext context){
        // return AlertDialog(content: Text("Congratulation! You Are Registered Now"),);}
        Navigator.of(context).pushNamed("/home", arguments: data);
    }
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
            child:Column(
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
                  controller: passwordController,
                  decoration:InputDecoration(
                    labelText:"Enter Password"
                  )
                ),
                SizedBox(height:10),
              
             

                Container(color:Colors.amber,
                  child: ElevatedButton( onPressed: register, child: Text("Register",   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 30))),
                ),

                 SizedBox(height:10),
                  Container(color:Colors.amber,
                  child: ElevatedButton( onPressed: register, child: Text("SignIn",   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 30))),
                )
               
              ]
            )
          )
        ),
      )
    );
  }
}