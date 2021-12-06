import 'package:flutter/material.dart';

class DatosPerfilPaciente extends StatelessWidget {

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
                          Text("INFORMACION DE HORARIOS DE ATENCION",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
                          
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  //decoration: BoxDecoration(
                                 //   borderRadius: BorderRadius.all(Radius.circular()),
                                  //),
                
                                  child: Container(
                                    
                                    child: TextFormField(
                                      
                                      decoration: InputDecoration(labelText: "Nombre:",contentPadding: EdgeInsets.only(left: 10),),
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5,),
                          
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  //decoration: BoxDecoration(
                                 //   borderRadius: BorderRadius.all(Radius.circular()),
                                  //),
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: "Especialidad:",contentPadding: EdgeInsets.only(left: 10)),
                                    
                                  ),
                                  
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  //decoration: BoxDecoration(
                                 //   borderRadius: BorderRadius.all(Radius.circular()),
                                  //),
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: "Dias Trabajados:",contentPadding: EdgeInsets.only(left: 10),),
                                    
                                  ),
                                  
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  //decoration: BoxDecoration(
                                 //   borderRadius: BorderRadius.all(Radius.circular()),
                                  //),
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: "Hora de Atención:",contentPadding: EdgeInsets.only(left: 10)),
                                    
                                  ),
                                  
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  //decoration: BoxDecoration(
                                 //   borderRadius: BorderRadius.all(Radius.circular()),
                                  //),
                                  child: TextFormField(
                                    decoration: InputDecoration(prefixIcon: new Icon(Icons.phone_rounded),contentPadding: EdgeInsets.only(left: 10)),
                                    
                                  ),
                                  
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                );
  }
}