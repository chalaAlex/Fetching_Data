import 'package:fetching_displaying_data/view/product_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fetching_displaying_data/controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Demon On Fetching and Displaying data"),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "D Shop",
                    style: TextStyle(
                      fontFamily: 'avehir',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.view_list_sharp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.grid_view),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    mainAxisSpacing: 10.0, 
                    crossAxisSpacing: 10.0, 
                    childAspectRatio: 1.0,
                  ),
                  itemCount: productController
                      .ProductList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  ProductTile(productController.ProductList[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
