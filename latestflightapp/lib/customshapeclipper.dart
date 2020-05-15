import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
@override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height - 50);
    var firstControlPoint = Offset(size.width *0.20 ,size.height-70,);
    path.quadraticBezierTo(firstControlPoint.dx,firstControlPoint.dy ,firstEndPoint.dx, firstEndPoint.dy);
    // Same thing as above path.quadraticBezierTo(size.width *0.25 ,size.height-70,size.width * 0.5, size.height - 50 );
    var secondEndPoint = Offset(size.width , size.height - 80);
    var secondControlPoint = Offset(size.width *0.80 ,size.height-20,);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }

}
  
