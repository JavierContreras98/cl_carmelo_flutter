import 'package:cl_carmelo/src/screens/registo_cita/registro_cita.dart';
import 'package:flutter/material.dart';

class DatosCitasPendientes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
                 elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                  color: Color.fromRGBO(248, 232, 196, 1),
                  margin: EdgeInsets.all(8.0) ,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: <Widget>[
                          Text("Fecha: Lunes 15 de marzo de 2021",style: TextStyle(fontSize: 15),),
                          SizedBox(height: 8,),
                          Text("Hora: 10:00 a.m",style: TextStyle(fontSize: 15),),
                          SizedBox(height: 8,),
                          Text("Consulta General",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
                          Text("Dr.Jose Hernandez",style: TextStyle(fontSize: 15),),
                           RaisedButton(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Color.fromRGBO(167, 137, 71, 1),
                      padding: const EdgeInsets.symmetric(vertical:5,),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroCitaPage() ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Agendar nueva cita",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                        ],
                      ),
                    ),
                );
  }
}