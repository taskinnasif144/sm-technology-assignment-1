import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.headerText});
  final String headerText;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(headerText, style: GoogleFonts.getFont('Akatab', fontSize: 18, fontWeight: FontWeight.bold),),
        Text("See More", style: GoogleFonts.getFont('Roboto', fontSize: 14),),
      ],
    );
  }
}
