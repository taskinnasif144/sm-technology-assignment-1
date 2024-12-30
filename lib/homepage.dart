import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/routes_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Assignments"),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssignmentNavigation(route:Routes.assignment1, buttonName: "Assignment 1",),
          AssignmentNavigation(route:Routes.assignment2, buttonName: "Assignment 2",),
          AssignmentNavigation(route:Routes.assignment3, buttonName: "Assignment 3",)
        ],
      ),
    ));
  }
}

class AssignmentNavigation extends StatelessWidget {
  const AssignmentNavigation({
    super.key,
    required this.route,
    required this.buttonName
  });

  final String route;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(
              buttonName,
              style: GoogleFonts.getFont("Roboto",
                  fontSize: 18, color: Colors.white),
            )),
      ),
    );
  }
}

//Center(child: Text("HI"),);
