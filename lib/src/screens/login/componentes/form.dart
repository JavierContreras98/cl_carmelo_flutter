import 'package:cl_carmelo/src/screens/login/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/login/componentes/contenedor.dart';
import 'package:cl_carmelo/src/screens/menu_principal/menu_principal.dart';
import 'package:cl_carmelo/src/screens/registro_paciente/registro_paciente.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class FormLogin extends StatelessWidget {

  TextEditingController expediente = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    
  Future<dynamic> login() async {
    var url= "https://flutterclcarmelo.000webhostapp.com/ws/login.php";
    final response = await http.post(Uri.parse(url), body: {
      "num_exp": expediente.text,
      "pass": pass.text
    });

    if(response.body == "CORRECTO") {
      Fluttertoast.showToast(
        msg: "LOGIN CORRECTO",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipalPage()));
    }else if(response.body == "ERROR") {
      Fluttertoast.showToast(
        msg: "LOGIN INCORRECTO",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1
      );
    }
    }

    return Stack(
    children: <Widget>[
      BannerLogin(),
      ContenedorLogin(),
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
                    TextFormField(
                      controller: expediente,
                      decoration: InputDecoration(
                          hintText: "Ingrese numero de expediente"),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: pass,
                      decoration:
                          InputDecoration(hintText: "ingrese contraseña"),
                      //para campo de contraseña
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Color.fromRGBO(167, 137, 71, 1),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textColor: Colors.white,
                      onPressed: () {
                        login();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Ingresar",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "¿No tienes cuenta? ",style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistroPacientePage() ));
                          } ,
                          child: Text("Registrate",
                           style: TextStyle(
                             color: Color.fromRGBO(167, 137, 71, 1),
                             fontWeight: FontWeight.bold, 
                             fontSize: 22),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      )
    ],
  );
  }
  //void login(){
    //var url = "http://192.168.0.21/clcarmelo/login.php";
    //http.post(Uri.parse(url),body: {
      //"num_exp": expediente.text,
      //"pass": pass.text
  //}); 
  //Fluttertoast.showToast(msg: "Sesion Iniciada");
  //}
}