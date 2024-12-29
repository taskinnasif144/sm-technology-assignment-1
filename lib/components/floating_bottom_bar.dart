import 'package:flutter/material.dart';


List<IconData> navIcons = [
  Icons.home,
  Icons.tv,
  Icons.download,
  Icons.person_2_outlined
];


class FloatingBottomBar extends StatefulWidget {
  const FloatingBottomBar({super.key});

  @override
  State<FloatingBottomBar> createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 65,
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navIcons.map((icon) {
            int currentIndex = navIcons.indexOf(icon);
            bool isSelected = selectedIndex == currentIndex;
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = currentIndex;
                });
              },
              child: Icon(
                icon,
                size: 28,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.tertiary,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
