import 'package:flutter/material.dart';

class ContenedorMenuPrincipal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, 200, 1),
      decoration: BoxDecoration(
        color: Color.fromRGBO(218, 186, 118, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50)
        )
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 15,),
          Text('MENU PRINCIPAL',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 15,),
              Text('Clinica Carmelo',style: TextStyle(fontSize: 15),)  
            ],
          )
        ],
      ),         
    );
  }
}