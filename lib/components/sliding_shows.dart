import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/components/section_header.dart';
import 'package:netflix/constants.dart';

class SlidingShows extends StatelessWidget {
  const SlidingShows({super.key, required this.headerText, required this.movies});
  final String headerText;
  final List<Map<String, String>> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(headerText: headerText),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 182,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingMovies.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 132,
                    width: 100,
                    margin: EdgeInsets.only(right: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: AssetImage(movies[index]['image']!), fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Flexible(child: Text(movies[index]['name']!, style: GoogleFonts.getFont("Akatab", fontSize: 14),))
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
