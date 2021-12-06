import 'package:flutter/material.dart';

class ContenedorCitaspendientes extends StatelessWidget {

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
                      
                      //Icon(Icons.person_add_alt_1),
                      
                      Text('CITAS PENDIENTES',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15,),
                      
                      //Text('Clinica Carmelo',style: TextStyle(fontSize: 20),)
                      
                    ],
                    )
                  ],
                  ),
                );
  }
}