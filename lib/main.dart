import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:netflix/homepage.dart';
import 'package:netflix/models/hive_product_model.dart';
import 'package:netflix/models/routes_model.dart';
import 'package:netflix/pages/assignment_1.dart';
import 'package:netflix/pages/assignment_2.dart';
import 'package:netflix/pages/assignment_3.dart';
import 'package:netflix/provider/cached_product_provider.dart';
import 'package:netflix/provider/product_provider.dart';
import 'package:netflix/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider<CachedProductProvider>(
          create: (_) => CachedProductProvider(),
        )
      ],
      child: MaterialApp(routes: {
        Routes.assignment1: (context) => Assignment1(),
        Routes.assignment2: (context) => Assignment2(),
        Routes.assignment3: (context) => Assignment3()
      }, title: 'Flutter Demo', theme: darkMode, home: HomePage()),
    );
  }
}
