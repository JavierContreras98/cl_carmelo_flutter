import 'package:cl_carmelo/src/screens/integrantes/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/integrantes/componentes/contenedor.dart';
import 'package:cl_carmelo/src/screens/integrantes/componentes/datos.dart';
import 'package:flutter/material.dart';

class EstructuraIntegrantes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[  
            BannerIntegrantes(),
            ContenedorIntegrantes(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 250),
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(padding: EdgeInsets.all(0.1),
              child:Center(child: Center(child: Column(children: <Widget>[
                DatosIntegrantes()
              ],),),)),
            ),
          
          ],
    );
  }
}