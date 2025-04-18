import 'package:flutter/material.dart';
import 'package:product_catalog/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  List<String> getProductTags(Product product) {
    final tags = <String>[];
    if (product.category != null) tags.add(product.category!);

    if (product.title.toLowerCase().contains('mascara')) {
      tags.add('mascara');
    }
    return tags;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.thumbnail ?? '',
                height: 200,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(
              product.brand ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$${product.originalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '-${product.discountPercentage.toStringAsFixed(2)}%',
                  style: const TextStyle(color: Colors.redAccent),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                ...List.generate(5, (index) {
                  double rating = product.rating;
                  if (index < rating.floor()) {
                    return const Icon(
                      Icons.star,
                      color: Colors.black,
                      size: 20,
                    );
                  } else if (index < rating) {
                    return const Icon(
                      Icons.star_half,
                      color: Colors.black,
                      size: 20,
                    );
                  } else {
                    return const Icon(
                      Icons.star_border,
                      color: Colors.black,
                      size: 20,
                    );
                  }
                }),
                const SizedBox(width: 4),
                Text(
                  '(${product.rating.toStringAsFixed(1)})',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Text(product.description, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 16),

            const Text(
              "Tags",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            Wrap(
              spacing: 8,
              children:
                  getProductTags(product).map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: Colors.grey[200],
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
