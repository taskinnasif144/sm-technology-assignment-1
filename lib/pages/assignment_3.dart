import 'package:flutter/material.dart';
import 'package:netflix/components/build_grid_view.dart';
import 'package:netflix/components/header.dart';
import 'package:netflix/components/search.dart';
import 'package:provider/provider.dart';
import '../provider/cached_product_provider.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<CachedProductProvider>(context, listen: false)
          .prepareAllProducts();
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
            Consumer<CachedProductProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading){
                  return Center(child: CircularProgressIndicator(),);
                } else {
                  final products = provider.products;
                  return Expanded(
                    child: buildGridView(products, true),
                  );
                }

              },
            )
          ],
        ),
      ),
    ));
  }
}
