import 'package:cl_carmelo/src/screens/login/login_screen.dart';
import 'package:cl_carmelo/src/screens/registro_paciente/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/registro_paciente/componentes/contenedor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class FormRegistroPaciente extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  TextEditingController expediente = new TextEditingController();
  TextEditingController primernom = new TextEditingController();
  TextEditingController segundonom = new TextEditingController();
  TextEditingController primerape = new TextEditingController();
  TextEditingController segundoape = new TextEditingController();
  TextEditingController numdoc = new TextEditingController();
  TextEditingController telefono = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  void agregarPaciente(){
    var url = "http://192.168.0.18/clcarmelo/registrarPaciente.php";

    http.post(Uri.parse(url),body: {
      "num_exp": expediente.text,
      "primer_nom": primernom.text,
      "segundo_nom": segundonom.text,
      "primer_ape": primerape.text,
      "segundo_ape": segundoape.text,
      "num_doc": numdoc.text,
      "telefono": telefono.text,
      "pass": pass.text
    }); 
    Fluttertoast.showToast(msg: "Registro exitoso!!");
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }


    return Stack(
          children: <Widget>[
            BannerRegistroPaciente(),
            ContenedorRegistroPaciente(),
            Center(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 260),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          
                          TextFormField(controller: expediente, decoration: InputDecoration(hintText: "Expediente" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: primernom,decoration: InputDecoration(hintText: "Primer nombre" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: segundonom, decoration: InputDecoration(hintText: "Segundo nombre" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: primerape, decoration: InputDecoration(hintText: "Primer apellido" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: segundoape, decoration: InputDecoration(hintText: "Segundo apellido" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: numdoc, decoration: InputDecoration(hintText: "Número de documento" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: telefono, decoration: InputDecoration(hintText: "Teléfono" ),
                          ),
                          SizedBox(height: 15,),
                          TextFormField(controller: pass, decoration: InputDecoration(hintText: "Contraseña" ),
                          //para campo de contraseña
                          obscureText: true,
                          ),
                          SizedBox(height: 15,),
                          RaisedButton(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            ),
                            color: Color.fromRGBO(167, 137, 71, 1),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            textColor: Colors.white,
                            onPressed: (){
                              agregarPaciente();
                              
                            },
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              Text("Registrarse",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                ],
                ),
                ),
              )  
            ),
            )
          ],
    );
  }
}

