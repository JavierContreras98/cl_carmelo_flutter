import 'package:cl_carmelo/src/screens/login/componentes/form.dart';
import 'package:flutter/material.dart';

class MainDesignLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            )),
          ),
          //title: Text('Clinica Carmelo'),
          backgroundColor: Colors.grey.shade800,
        ),
      ),
      body: FormLogin(),
    );
  }
}


