import 'package:cl_carmelo/src/screens/citas_pedientes/citas_pendientes.dart';
import 'package:cl_carmelo/src/screens/historial_cita/historial_cita.dart';
import 'package:cl_carmelo/src/screens/integrantes/integrantes.dart';
import 'package:cl_carmelo/src/screens/map_carmelo/map_screen.dart';
import 'package:cl_carmelo/src/screens/menu_principal/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/menu_principal/componentes/contenedor.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/perfil_medico.dart';
import 'package:cl_carmelo/src/screens/registo_cita/registro_cita.dart';
import 'package:flutter/material.dart';

class OpcionesMenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[  
            BannerMenuPrincipal(),
            ContenedorMenuPrincipal(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 220),
              padding: EdgeInsets.all(90.0),
              child: GridView.count(crossAxisCount: 2,
              children: <Widget>[
                Card(
                  color: Color.fromRGBO(218, 186, 118, 1),
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroCitaPage()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.calendar_today, size:100,),
                          Text("Registrar cita", style :new TextStyle(fontSize:25 ))
                        ],
                      ),
                    ),
                  ),
                ),
                 Card(
                  color: Color.fromRGBO(218, 186, 118, 1),
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilMedicoPage()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.person_search_rounded , size:100,),
                          Text("Perfil Medico", style :new TextStyle(fontSize:25))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color.fromRGBO(218, 186, 118, 1),
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistorialCitaPage()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.update_rounded, size:100,),
                          Text("Historial de citas", style :new TextStyle(fontSize:23.3 ))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color.fromRGBO(218, 186, 118, 1),
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CitasPedientesPage()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.date_range, size:100),
                          Text("Citas Pendientes", style :new TextStyle(fontSize:23.2 ))
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color.fromRGBO(218, 186, 118, 1),
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => IntegrantesPage()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.groups, size:100,),
                          Text("Integrantes", style :new TextStyle(fontSize:25 ))
                        ],
                      ),
                    ),
                  ),
                ),
                 Card(
                  color: Color.fromRGBO(218, 186, 118, 1),
                  margin: EdgeInsets.all(8.0) ,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapScreen()));
                    },
                    splashColor: Colors.amber.shade100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Icon(Icons.map, size:100,),
                          Text("Donde nos encontramos", style :new TextStyle(fontSize:25 ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],),
            ),
            
          ],
        );
  }
}