import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit List',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const FruitHomePage(),
    );
  }
}

class FruitHomePage extends StatelessWidget {
  const FruitHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fruit Market',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [

          FruitItem(
            fruitName: 'Apple',
            price: '₹180 / kg',
            description: 'Fresh Red Apple',
            image: 'assets/images/apple.jpeg',
          ),

          FruitItem(
            fruitName: 'Banana',
            price: '₹60 / dozen',
            description: 'Fresh Yellow Banana',
            image: 'assets/images/banana.jpeg',
          ),

          FruitItem(
            fruitName: 'Mango',
            price: '₹120 / kg',
            description: 'Fresh and Juicy Mango',
            image: 'assets/images/mango.jpeg',
          ),

          FruitItem(
            fruitName: 'Orange',
            price: '₹80 / kg',
            description: 'Fresh Sweet Orange',
            image: 'assets/images/orange.jpeg',
          ),
        ],
      ),
    );
  }
}

class FruitItem extends StatelessWidget {
  final String fruitName;
  final String price;
  final String description;
  final String image;

  const FruitItem({
    super.key,
    required this.fruitName,
    required this.price,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),

        child: Row(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    fruitName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}