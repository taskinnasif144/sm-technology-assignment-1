
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

GridView buildGridView(List<dynamic> products, isCached) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18.0,
        crossAxisSpacing: 8.0,
        mainAxisExtent: 250),
    padding: EdgeInsets.all(8.0),
    itemCount: products.length,
    itemBuilder: (context, index) {
      final product = products[index];
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:  isCached? CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ) : Image(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.length > 40
                        ? '${product.title.substring(0, 40)}...'
                        : product.title,
                    style: TextStyle(fontSize: 12),
                  ),
                  Text('\$ ${product.price}'),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(product.rating["rate"].toString())
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}