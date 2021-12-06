import 'package:cl_carmelo/src/screens/menu_principal/menu_principal.dart';
import 'package:cl_carmelo/src/screens/registo_cita/componentes/banner.dart';
import 'package:cl_carmelo/src/screens/registo_cita/componentes/contenedor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormRegistroCita extends StatefulWidget {
  FormRegistroCita({Key key}) : super(key: key);
  
  @override
  _FormRegistroCita createState() => _FormRegistroCita();
}

class _FormRegistroCita extends State<FormRegistroCita> {

  
  List data = [];

  Object selectedName;

  Future getAllName()async{
    var response = await http.get(Uri.parse("https://flutterclcarmelo.000webhostapp.com/ws/obtenerEspecialidades.php"));
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data = jsonData;
    });
    print(jsonData);
    return "exito";
  }

  List data2 = [];

  Object selectedName2;

  Future getMedicoxEsp() async{

    var response = await http.get(Uri.parse("https://flutterclcarmelo.000webhostapp.com/ws/obtenerMedicoxEsp.php"));
    var jsonBody = response.body;
    var jsonData = json.decode(jsonBody);

    setState(() {
      data2 = jsonData;
    });
    print(jsonData);
    return "exito";
  }


  TextEditingController dateinput = TextEditingController(); 
  TextEditingController timeinput = TextEditingController(); 
  TextEditingController paciente = TextEditingController();
  TextEditingController especialidad = TextEditingController();
  TextEditingController medico = TextEditingController();
  

  void registrarCita(){
    setState(() {
      var url = "https://flutterclcarmelo.000webhostapp.com/ws/registrarCita.php";

      http.post(Uri.parse(url),body: {
      "hora_cita": timeinput.text,
      "fecha_cita": dateinput.text,
      "expediente": paciente.text,
      "id_especialidad": selectedName,
      "id_medico": selectedName2,
    }); 
      Fluttertoast.showToast(msg: "Registro de cita exitoso!!");
      Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPrincipalPage()));
    });
    
  }

  @override
  void initState(){
    timeinput.text = "";
    super.initState();
    getAllName();
    getMedicoxEsp();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: <Widget>[
            BannerRegistrocita(),
            ContenedorRegistroCita(),  
            Form(
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
                    SizedBox(height: 20,),
                    DropdownButton(
                      value: selectedName,
                      iconSize: 36,
                      icon:  Icon(Icons.arrow_drop_down, color: Colors.black,),
                      isExpanded: true,
                      hint: Text("Seleccion una especialidad"),
                      items: data.map((list){
                        return DropdownMenuItem(
                          child: Text(list['NOMBRE']),
                          value: list['ID'],
                          );
                      },).toList(),
                        onChanged: (value) => setState(()=>this.selectedName = value),
                      ),
                      SizedBox(height: 20,),
                      DropdownButton(
                      value: selectedName2,
                      iconSize: 36,
                      icon:  Icon(Icons.arrow_drop_down, color: Colors.black,),
                      isExpanded: true,
                      hint: Text("Seleccion un medico"),
                      items: data2.map((list2){
                        return DropdownMenuItem(
                          child: Text(list2['NOMBRE']),
                          value: list2['ID'],
                          );
                      },).toList(),
                        onChanged: (value) => setState(()=>this.selectedName2 = value),
                      ),
            
                  SizedBox(height: 20,),
                  TextFormField(controller: dateinput,onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context, 
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); 

                      setState(() {
                         dateinput.text = formattedDate;
                      });
                  }else{
                      print("Fecha no ha sido seleccionada");
                  }
                },
                  decoration: InputDecoration(hintText: "Fecha seleccionada para la cita" ),
                  //para campo de contraseña
                  //obscureText: true,
                  ),
                   SizedBox(height: 20,),
                  TextFormField(controller: timeinput, onTap: () async {
                    var time =  await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,);
                      timeinput.text = time.format(context);      
                  },
                  decoration: InputDecoration(hintText: "Hora seleccionada para la cita" ),
                  //para campo de contraseña
                  //obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  TextFormField(controller: paciente,decoration: InputDecoration(hintText: "Ingrese su número de expediente" ),
                  //para campo de contraseña
                  //obscureText: true,
                  ),
                  SizedBox(height: 20,),
                  RaisedButton(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        ),
                   color: Color.fromRGBO(167, 137, 71, 1),
                   padding: const EdgeInsets.symmetric(vertical: 15),
                   textColor: Colors.white,
                   onPressed: (){
                     registrarCita();
                   },
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                     Text("Registrar",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),   
                   ],),
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

