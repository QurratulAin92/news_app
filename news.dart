import 'package:flutter/material.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:   
          Container(
        child:SafeArea(
          child:SingleChildScrollView(
                      child: Center(
                      
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                //  SizedBox(height:10),
                  Expanded(
                                      child: Container(
                     
                      child: Text("News Application",
                     style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 40)),
                     
                     color:Colors.deepOrangeAccent[400],height:50,width:500),
                  ),
                  Image.network("https://tpc.googlesyndication.com/simgad/16386992032807688434?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&rs=AOga4qmIeLl28sQHmYiOPNaBlZh9Oh_SmA"),

                  // SizedBox(height:10),
                  Column(
                  
                  children:[
                                    Image.network("https://www.washingtonpost.com/wp-apps/imrs.php?src=https%3A%2F%2Farc-anglerfish-washpost-prod-washpost%252Es3%252Eamazonaws%252Ecom%2Fpublic%2FD5O5NBENQUI6XIZ63IUJIHFZVQ%252Ejpg&w=496&h=331"),
                                    Text("Corona Virus Covid 19"),
                                    Text("Relative to population, though, the toll has been higher in rural areas."),
                 
                                ]
                ),
                 //SizedBox(height:10),
                  Column(
                  children:[
                                    Image.network("https://ichef.bbci.co.uk/live-experience/cps/800/cpsprodpb/16574/production/_120780519_ntfcgettyimages-1338310651.jpghttps://ichef.bbci.co.uk/live-experience/cps/800/cpsprodpb/16574/production/_120780519_ntfcgettyimages-1338310651.jpg"),
                                    Text("Football club to host 50 Afghan refugees at gameFootball club to host 50 Afghan refugees at game"),
                                    Text("The group is described as all big football fans and will be at a League Two match on Saturday."),
                 
                                ]
                ),
                // SizedBox(height:10),
                  Column(
                  children:[
                                    Image.network("https://www.geo.tv/assets/uploads/updates/2021-10-01/t_373429_050834_updates.jpg"),
                                    Text("Shahid Afridi enjoys 'lovely Karachi weather' with family, tells people to stay safe"),
                                    Text("Former Pakistani cricket captain Shahid Afridi took to Twitter on Friday and wrote that he is enjoying the lovely weather of Karachi along with his family."),
                 
                                ]
                ),
                 //SizedBox(height:10),
                 
                  Column(
                  children:[
                                    Image.network("https://tse3.mm.bing.net/th?id=OIP.n_gsugs2TidohScUg8vK5AHaFj&pid=Api&P=0&w=234&h=175https://tse3.mm.bing.net/th?id=OIP.n_gsugs2TidohScUg8vK5AHaFj&pid=Api&P=0&w=234&h=175"),
                                    Text("Live Karachi weather updates: Cyclone Shaheen to recurve to Oman after tomorrow evening"),
                                    Text("KARACHI: The Pakistan Meteorological Department (PMD) has issued another advisory — the final alert – regarding tropical storm Shaheen, stating that it will likely move west-northwestwards by tomorrow evening after which it is likely to recurve southwestward and head to Muscat."),
                 
                                ]
                ),

                  
              
                ]
              ),
            ),
          )
        )
      ),
    );
  }
}