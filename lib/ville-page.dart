import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import './cinemas-page.dart';

import 'cinemas-page.dart'; //pour deserealiser les donnees JSON

class VillePage extends StatefulWidget {
  @override
  _VillePageState createState() => _VillePageState();
}

class _VillePageState extends State<VillePage> {
  List<dynamic> listVilles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Villes"),),
      body: Center(
        child: this.listVilles==null?CircularProgressIndicator():
            ListView.builder(
              itemCount: (this.listVilles==null)?0:this.listVilles.length,
              itemBuilder: (context,index)
              {
                return Card(
                  color:Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color:Colors.white,
                      child: Text(this.listVilles[index]["name"],style: TextStyle(color: Colors.black),),
                      onPressed: ()
                      {
                          // Pour ouvrir une nouvelle page
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> new CinemasPage(listVilles[index])));
                      },
                    ),
                  ),
                );
              }
            )
      ),
    );
  }

  //Cette methode s execute au moment de l initialisation du widget
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVille();
  }

  Future<void> loadVille() async {
    //String url="http://192.168.43.228:8085/villes"; // direction vers la partie backend 192.168.43.228 l @IP ou se trouve url
    String url ="https://cinema-backend-app.herokuapp.com/villes"; // Deploy on heroku
    // setState() permet de chager les donnees du statefullsWidget
     await http.get(url)
        .then((value) {
         setState(() {
           //Deserealiser les donnees JSON
            this.listVilles=json.decode(value.body)["_embedded"]["villes"];
            print("bonjour a tous =+++++++++++++++++");
            print(this.listVilles);
         });
    }).catchError((error){
      print(error);
    });
  }}

