import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SallesPage extends StatefulWidget {
  dynamic cinema;
  SallesPage(this.cinema);
  @override
  _SallesPageState createState() => _SallesPageState();
}

class _SallesPageState extends State<SallesPage> {
  List<dynamic> listSalles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Salle du cinema de ${widget.cinema['name']}')),
      body: Center(
        child: Center(
          child: this.listSalles==null?CircularProgressIndicator():
              ListView.builder(
                  itemCount: this.listSalles==null?0:this.listSalles.length,
                  itemBuilder:(context,index){
                    return Card(
                      color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(this.listSalles[index]['name']),
                          onPressed: (){

                          },
                        ),
                      ),
                    );
                  })
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadSalles();
  }

  void loadSalles() {
   // String url ="https://cinema-backend-app.herokuapp.com/villes";
    print("alhamdoulilah+++++++++++++");
    String  url = this.widget.cinema['_links']['salles']['href'];
    http.get(url).then((value) {
      setState(() {
        this.listSalles=json.decode(value.body)['_embedded']['salles'];
        print('+++++++++++++====++++++${this.listSalles}');
      });
    }).catchError((error){
      print("erreur++++++++++++++++++");
      print(error);
    });
  }
}
