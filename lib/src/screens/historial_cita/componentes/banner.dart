import 'package:flutter/material.dart';

class BannerHistorialCita extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade200,
                    Colors.amber.shade200,
                  ],
                ),
              ),
              child: Image.asset("assets/images/banners/06 Historiacitas.png", height: 400, fit: BoxFit.cover,),
    );
  }
}