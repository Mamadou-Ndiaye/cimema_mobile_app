import 'package:cinema_app_phone/ville-page.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    appBarTheme: AppBarTheme(
      color: Colors.orange
    ),
  ),
  home: MyApp(),
));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(title: Text("Cinema page"),),
     body: Center(
       child: Text("Home Cinema"),
     ),
     drawer: Drawer(
       child: ListView(
         children: <Widget>[
           DrawerHeader(child: Center(
             child: CircleAvatar(
               backgroundImage: AssetImage("./images/profile.jpg"),
               radius: 20,
             ),
           ),
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [Colors.white,Colors.orange]
             )
           ),),
           Divider(
             color: Colors.orange,
           ),
           ListTile(
             title: Text("Home"),
             leading: Icon(Icons.home),
             trailing: Icon(Icons.arrow_right),
             onTap: (){
               Navigator.pop(context);
               Navigator.push(context, MaterialPageRoute(
                   builder: (context)=>VillePage()
                   ));
             },
           )
         ],
       ),
     ),
   );
  }

}