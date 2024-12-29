import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello Rafsan",style: GoogleFonts.getFont('Roboto', fontSize: 20), ),
            Opacity(opacity: 0.5, child: Text("Let's watch today", style: GoogleFonts.getFont('Roboto', fontSize: 14,)),)
          ],
        ),
        CircleAvatar(
          radius: 20,
          backgroundImage:
          AssetImage('assets/profile.png'),
        )
      ],
    );
  }
}
