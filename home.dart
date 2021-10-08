import 'package:e_commerce/categories.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/register.dart';
import 'package:e_commerce/news.dart';





class Home extends StatelessWidget {
 


  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
          home: Column(
           children: [
       SingleChildScrollView(
              child: Container(
                      width: 700,
                     height: 60,
                 
                  child: Text("News Application",
                 style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 40)),
                 
                 color:Colors.indigo[900]),
       ),
              //Image.network("https://tpc.googlesyndication.com/simgad/16386992032807688434?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&rs=AOga4qmIeLl28sQHmYiOPNaBlZh9Oh_SmA"),

             Expanded(
                child: SizedBox(
                                 height: 20,   child: DefaultTabController(length: 4,child: Scaffold(
        appBar: AppBar(
          
          
          backgroundColor: Colors.amber,
          title: Container(
               
              child: TabBar(
                   
                indicatorColor: Colors.white,
                tabs:[
                 Tab(child: Text("Profile"),),
                 Tab(child: Text("News By Categories"),),
                 Tab(child: Text("Signup"),),
                 Tab(child: Text("Popular News"),),

                 
              ]),
            )
        ),
        body: Column(
          
          children: [
            Container(
          
              child: TabBarView(
               
                children:[
                Profile(),
                Categories(),
                Register(),
                News(),
              ]),
            ),
       




          ],
        ),
      )),
                ),
             ),
           ],
         ),
    );
    
  }}