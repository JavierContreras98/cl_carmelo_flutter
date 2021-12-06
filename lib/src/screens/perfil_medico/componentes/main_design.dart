import 'dart:async';
import 'package:cl_carmelo/api/Medicos_api.dart';
import 'package:cl_carmelo/model/Medico.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/componentes/Buscar.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/componentes/contenedor.dart';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<Medico> medicos = [];
  String query = '';
  Timer debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final medicos = await MedicosApi.getMedicos(query);

    setState(() => this.medicos = medicos);
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Medico>> getMedicos(String query) async {
    final url = Uri.parse('http://192.168.0.13/clcarmelo/obtenerInfoMedico.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List medicos = json.decode(response.body);

      return medicos.map((json) => Medico.fromJson(json)).where((medico) {
        final titleLower = medico.nombre.toLowerCase();
        final authorLower = medico.especialidad.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
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
        body:Stack(
         children: <Widget>[  

          BannerPerfilMedico(),
            ContenedorPerfilMedico(),
            buildSearch(),
      //datos
      Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top:300),
      padding: EdgeInsets.all(0.0),
      child: GridView.count(crossAxisCount: 1,
      children: <Widget>[
      FutureBuilder<List<Medico>>(
      future: getMedicos(query),
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
                         Text("INFORMACION DEL MEDICO",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                         SizedBox(height: 15,),
                          Text("NOMBRE: "+data.nombre,style: TextStyle(fontSize: 22),),
                          SizedBox(height: 8,),
                          Text("ESPECIALIDAD: "+data.especialidad,style: TextStyle(fontSize: 22),),
                          SizedBox(height: 8,),
                          Text("CONTACTOS: ",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          SizedBox(height: 15,),
                          Text("CORREO: "+data.correo,style: TextStyle(fontSize: 21),),
                          SizedBox(height: 8,),
                          Text("TELEFONO: "+data.telefono.toString(),style: TextStyle(fontSize: 21),),
                          SizedBox(height: 8,),
                          Text("DIAS DE LLEGADA: "+data.diaslaborales,style: TextStyle(fontSize: 21),),
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
   Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nombre de Medico o Especialidad',
        onChanged: searchBook,
      );
  Future searchBook(String query) async => debounce(() async {
        final medicos = await MedicosApi.getMedicos(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.medicos = medicos;
        });
      });

   Widget buildBook(Medico medico) => ListTile(
        title: Text("\nNOMBRE: " +
            medico.nombre +
            "\n" +
            "ESPECIALIDAD: " +
            medico.especialidad),
        subtitle: Text("CONTACTOS: \n" +
            "CORREO: " +
            medico.correo +
            "\n" +
            "TELEFONO: " +
            medico.telefono.toString() +
            "\n" +
            "DIAS DE LLEGADA: " +
            "\n" +
            medico.diaslaborales),
      );
}

