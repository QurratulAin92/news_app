import 'dart:io';
//import 'dart:html' as html;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:mime_type/mime_type.dart';


class Post extends StatefulWidget {

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  Stream collectionStream = FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  Widget build(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  String imagePath;

 
  
  

    
  void imagePick ()async{

     //image picker code for web
      Image fromPicker = await ImagePickerWeb.getImage(outputType: ImageType.file);
  
      //image picker code for mobile
      final ImagePicker imagePicker = ImagePicker();
      final  image = await imagePicker.getImage(source: ImageSource.gallery);
      setState(() {
      imagePath = image.path;
      });
    }

      print(imagePath);
    
 

  void submit() async{
    try{

    String title = titleController.text;
    String des = desController.text;

    firebase_storage.FirebaseStorage storage =
     firebase_storage.FirebaseStorage.instance;

    firebase_storage.Reference ref =
  firebase_storage.FirebaseStorage.instance.ref('/image.jpeg');

  File file = File(imagePath);
  await ref.putFile(file);

  print("file uploaded");
    }
    catch(e){
      print(e.message);
    }
  }
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
        children: [
           TextFormField(
                    controller: titleController,
                    decoration:InputDecoration(
                      labelText:"Enter title"
                    ),),
                     TextFormField(
                    controller: desController,
                    decoration:InputDecoration(
                      labelText:"Enter description"
                    ),),
                    ElevatedButton(onPressed: imagePick, child : Text("Pick image")),
                    ElevatedButton(onPressed: submit, child : Text("Submit")),
           Expanded(
                      child: StreamBuilder<QuerySnapshot>(
              stream: collectionStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                  return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                  Map data = document.data();
                    return SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.blueGrey,width: 2),
                                ),
                        
                              width: 400.0,
                              padding: EdgeInsets.all(24.0),
                              child:Column(
                      
                              children:[
                                  Image.network(data["url"]),
                                  Text(data["title"]),
                                  Text(data["description"]),
               
                              ]
                 )
                    ),
                  );
                  }).toList(),
                );
  
                 
                
              }
          ),
           ),

        ],
      ),
    )));
  }
}



