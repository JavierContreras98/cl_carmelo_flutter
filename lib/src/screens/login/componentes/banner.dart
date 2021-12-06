import 'package:flutter/material.dart';

class BannerLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return  Container(
    width: double.maxFinite,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.orange.shade200,
          Colors.amber.shade200,
        ],
      ),
    ),
    child: Image.asset(
      "assets/images/banners/login.jpg",
      height: 400,
      fit: BoxFit.cover,
    ),
  );
  }
}