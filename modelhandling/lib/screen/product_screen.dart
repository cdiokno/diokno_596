import 'package:flutter/material.dart';
import 'package:modelhandling/model/productmodel.dart';
import '../controller/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final controller = ProductController();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
      final data = await controller.getProducts();
      setState(() {
        products = data;
      });
    }

  void deleteProduct(int id) async {
    await controller.deleteProduct(id);
    loadProducts();
  }

  void addProduct() async {
    if (nameController.text.isEmpty || priceController.text.isEmpty || quantityController.text.isEmpty) {
      return;
    } else{
      final product = Product(
        name: nameController.text,
        price: double.tryParse(priceController.text) ?? 0,
        quantity: int.tryParse(quantityController.text) ?? 0,
      );
    }
    final product = Product(
      name: nameController.text,
      price: double.tryParse(priceController.text) ?? 0,
      quantity: int.tryParse(quantityController.text) ?? 0,
    );

    await controller.addProduct(product);
    nameController.clear();
    priceController.clear();
    quantityController.clear();
    loadProducts();
  }

  void _onAddProductPressed() async {
    final name = nameController.text;
    final price = double.tryParse(priceController.text) ?? 0;
    final qty = int.tryParse(quantityController.text) ?? 0;
    if (name.isEmpty || price <= 0 || qty <= 0) return;

    final product = Product(name: name, price: price, quantity: qty);
    await controller.addProduct(product);
    nameController.clear();
    priceController.clear();
    quantityController.clear();
    loadProducts();
  }

  void _onDeleteProductPressed(int id) async {
    await controller.deleteProduct(id);
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Orders')),
      body: Column(
        children: [
          // Form
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _onAddProductPressed,
                  child: const Text('Add Product'),
                ),
              ],
            ),
          ),

          // Summary Card
          Card(
            margin: const EdgeInsets.all(16),
            color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text('Total Items'),
                      Text(
                        '${controller.calculateTotalItems(products)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('Grand Total'),
                      Text(
                        '₱${controller.calculateGrandTotalItem(products).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Product List
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(
                    '₱${product.price} x ${product.quantity} = ₱${product.price * product.quantity}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _onDeleteProductPressed(product.id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}