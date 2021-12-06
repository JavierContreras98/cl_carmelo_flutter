import 'package:flutter/material.dart';

class FiltroPerfilMedico extends StatelessWidget {

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
                          Text("Datos del medico",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                          Container(
                             height: 120.0,
    width: 120.0,
    decoration: new BoxDecoration(
      image: DecorationImage(
        image: new NetworkImage(
            'https://img2.freepng.es/20190519/jay/kisspng-computer-icons-physician-doctor-of-medicine-5ce18517bf8b65.5891110615582835437846.jpg'),
        fit: BoxFit.fill,
      ),
      shape: BoxShape.circle,
    ),
                          ),
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
                                  child: TextFormField(
                                    decoration: InputDecoration(hintText: "seleccione especialidad",contentPadding: EdgeInsets.only(left: 10)),
                                    
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 5,),
                          Icon(Icons.crop_square,size: 20,),
                          Text("Activa busqueda por nombre medico",style: TextStyle(fontSize: 18),),
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
                                    decoration: InputDecoration(hintText: "Seleccione un medico",contentPadding: EdgeInsets.only(left: 10)),
                                    
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