
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Product Model
class Product {
  final String name;
  final String price;
  final String description;
  final IconData icon;

  const Product({
    required this.name,
    required this.price,
    required this.description,
    required this.icon,
  });
}

// Main Application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const ProductCatalog(),
    );
  }
}

// Product Catalog Page
class ProductCatalog extends StatelessWidget {
  const ProductCatalog({super.key});

  static const List<Product> products = [
    Product(
      name: 'Smartphone',
      price: '₹25,999',
      description: 'Latest smartphone with powerful performance.',
      icon: Icons.smartphone,
    ),
    Product(
      name: 'Laptop',
      price: '₹59,999',
      description: 'Powerful laptop for work and study.',
      icon: Icons.laptop,
    ),
    Product(
      name: 'Headphones',
      price: '₹2,499',
      description: 'Wireless headphones with clear sound.',
      icon: Icons.headphones,
    ),
    Product(
      name: 'Smart Watch',
      price: '₹4,999',
      description: 'Smart watch with fitness tracking.',
      icon: Icons.watch,
    ),
    Product(
      name: 'Camera',
      price: '₹45,999',
      description: 'High-quality digital camera.',
      icon: Icons.camera_alt,
    ),
    Product(
      name: 'Tablet',
      price: '₹19,999',
      description: 'Portable tablet for entertainment.',
      icon: Icons.tablet,
    ),
    Product(
      name: 'Keyboard',
      price: '₹1,999',
      description: 'Comfortable keyboard for everyday use.',
      icon: Icons.keyboard,
    ),
    Product(
      name: 'Mouse',
      price: '₹999',
      description: 'Wireless mouse with ergonomic design.',
      icon: Icons.mouse,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E-Commerce Product Catalog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns;

          // Responsive layout
          if (constraints.maxWidth < 600) {
            columns = 2;
          } else if (constraints.maxWidth < 900) {
            columns = 3;
          } else {
            columns = 4;
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: products.length,

              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),

              itemBuilder: (context, index) {
                return ProductCard(
                  product: products[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Reusable Product Widget
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Product Icon
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  product.icon,
                  size: 70,
                  color: Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Product Name
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            // Product Description
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 8),

            // Product Price
            Text(
              product.price,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 8),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
