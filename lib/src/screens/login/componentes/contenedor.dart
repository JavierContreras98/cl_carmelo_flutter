import 'package:flutter/material.dart';

class ContenedorLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, 240, 1),
      decoration: BoxDecoration(
      color: Color.fromRGBO(218, 186, 118, 1),
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50), topRight: Radius.circular(50))),
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          'Bienvenidos a la App´s Carmelo',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Text(
              'Ingrese sus credenciales',
              style: TextStyle(fontSize: 30),
            )
          ],
        )
      ],
    ),
  );
  }
}