import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Widgets{
  static Widget circle(String src,String name,double hscale,double wscale){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 70*hscale,
            width: 70*wscale,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(75)),
              color: Color.fromRGBO(
                  226, 227, 227, 1),
            ),
            child: IconButton(
              onPressed: () {}, icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0*wscale,vertical: 8.0*hscale),
              child: Image.asset(
                  src),
            ),),
          ),
        ),
        Text(name,
          style: GoogleFonts.karla(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16*hscale
          ),),
      ],
    );
  }
}