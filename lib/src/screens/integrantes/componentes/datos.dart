import 'package:flutter/material.dart';

class DatosIntegrantes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
                 elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                  color: Color.fromRGBO(248, 232, 196, 1),
                  margin: EdgeInsets.all(0.0) ,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max ,
                        children: <Widget>[
                          Text("Grupo de Desarrollo de App´s Carmelo",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          SizedBox(height: 35,),
                          Text("Arévalo Guzmán, Mauricio Jose	25-2986-2017",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 25,),
                          Text("Ceron Funes, Jose Abel	 25-1572-2017 ",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 25,),
                          Text("Contreras Saravia, Javier Enrique	25-3159-2017",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 25,),
                          Text("Escobar López, Nelson Gerardo	25-3884-2016",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 25,),
                          Text("Esquivel Martínez, Raúl Antonio	25-0906-2017",style: TextStyle(fontSize: 20),),
                          SizedBox(height: 5,),
                          Image(image: AssetImage("assets/images/logo.png"), color: Colors.black,)
                        ],
                      ),
                    ),
                );
  }
}