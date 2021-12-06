import 'package:cl_carmelo/src/screens/menu_principal/componentes/opciones.dart';
import 'package:flutter/material.dart';

class MainDesignMenuPrincipal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
            }, icon: Icon(Icons.logout), iconSize: 50,color: Color.fromRGBO(218, 186, 118, 1) ,)
          ],
          //leading: IconButton(onPressed: (){}, icon: Icon(Icons.undo), iconSize: 60 ,color: Color.fromRGBO(218, 186, 118, 1) ,) ,
          backgroundColor: Colors.grey.shade800,
          ),
           
        ),
      body: OpcionesMenuPrincipal(),
    );
  }
}


