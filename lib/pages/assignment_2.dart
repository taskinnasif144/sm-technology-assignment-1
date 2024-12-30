import 'package:flutter/material.dart';
import 'package:netflix/components/build_grid_view.dart';
import 'package:netflix/components/header.dart';
import 'package:netflix/components/search.dart';
import 'package:netflix/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<ProductProvider>(context, listen: false).prepareAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 20,
            ),
            Search(),
            SizedBox(
              height: 20,
            ),
            Consumer<ProductProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final products = provider.products;
                  return Expanded(
                    child: buildGridView(products, false),
                  );
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
