import 'package:cl_carmelo/src/screens/perfil_medico/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/componentes/contenedor.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/componentes/datos.dart';
import 'package:cl_carmelo/src/screens/perfil_medico/componentes/filtro.dart';
import 'package:flutter/material.dart';

class EstructuraPerfilMedico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[  
            BannerPerfilMedico(),
            ContenedorPerfilMedico(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 250),
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(padding: EdgeInsets.all(0.1),
              child:Center(child: Center(child: Column(children: <Widget>[
                FiltroPerfilMedico(),
                DatosPerfilPaciente()
               
              ],),),)),
            ),
            
            
          ],
          
    );
  }
}