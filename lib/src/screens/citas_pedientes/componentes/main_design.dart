import 'package:cl_carmelo/src/screens/citas_pedientes/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/citas_pedientes/componentes/contenedor.dart';
import 'package:cl_carmelo/src/screens/registo_cita/registro_cita.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Cita {
  int id;
  String hora;
  String fecha;
  String especialidad;
  String medico;
  String expediente;
 
  Cita({
    this.id,
    this.hora,
    this.fecha,
    this.especialidad,
    this.medico,
    this.expediente
  });

  factory Cita.fromJson(Map<String, dynamic> json) {
    return Cita(
      hora: json['HORA_CITA'],
      fecha: json['FECHA_CITA'],
      especialidad: json['ESPECIALIDAD'],
      medico: json['MEDICO'],
      expediente: json['EXPEDIENTE']
    );
  }
}

class MainDesignCitasPendientes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String apiURL = 'http://192.168.0.18/clcarmelo/obtenerCitasPend.php';

  Future<List<Cita>> fetchCita() async {

    var response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {

      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Cita> citaList = items.map<Cita>((json) {
        return Cita.fromJson(json);
      }).toList();

      return citaList;
      }
     else {
      throw Exception('Failed to load data from Server.');
    }
  }
   return Scaffold(
     appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage( 
                image: AssetImage("assets/images/logo.png"), 
              )
            ),
          ),
          //title: Text('Clinica Carmelo'),
          actions: <Widget>[
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.logout), iconSize: 50,color: Color.fromRGBO(218, 186, 118, 1) ,)
          ],
          leading: IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.undo), iconSize: 60 ,color: Color.fromRGBO(218, 186, 118, 1) ,) ,
          backgroundColor: Colors.grey.shade800,
          ),
        ),
      body: Stack(
         children: <Widget>[  

            BannerCitasPendientes(),
            ContenedorCitaspendientes(),
      //datos
      Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top:300),
      padding: EdgeInsets.all(0.0),
      child: GridView.count(crossAxisCount: 1,
      children: <Widget>[
      FutureBuilder<List<Cita>>(
      future: fetchCita(),
      builder: (context, snapshot) {

      if (!snapshot.hasData) return Center(
        child: CircularProgressIndicator()
      );
      return ListView(
      children: snapshot.data.map((data) => Column(children: <Widget>[
        GestureDetector(
          child: Column(
          children: [
               Card(
                 elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Color.fromRGBO(248, 232, 196, 1),
                  margin: EdgeInsets.all(10.0) ,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min ,
                      children: [
                          Text("Expediente: "+data.expediente,style: TextStyle(fontSize: 21),),
                          SizedBox(height: 8,),
                          Text("Fecha: "+data.fecha,style: TextStyle(fontSize: 21),),
                          SizedBox(height: 8,),
                          Text("Hora: "+data.hora,style: TextStyle(fontSize: 21),),
                          SizedBox(height: 8,),  
                          Text("Consulta  "+data.especialidad,style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),  
                          Text("Medico: "+data.medico,style: TextStyle(fontSize: 21),),
                          SizedBox(height: 8,),   
                    ],),
                  ),
              ),
            
      ]),),
      ],))
    .toList(),
    );
    },
  ), 
              ],),
            ),
            
          ],
        )
    );
  }
}


