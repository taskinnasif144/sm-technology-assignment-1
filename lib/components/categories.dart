import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/components/section_header.dart';
import 'package:netflix/constants.dart';


class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      SectionHeader(headerText: "Categories",),
        SizedBox(
          height: 65,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categoryTypes.length,
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex;
               return GestureDetector(
                 onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                 },
                 child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10, right: 15),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: isSelected? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary
                  ),
                  child: Text(categoryTypes[index], style: GoogleFonts.getFont("Akatab", fontSize: 14),),
                               ),
               );
            },
          ),
        )
      ],
    );
  }
}

