import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

import '../services/get_all_products_service.dart';
import '../widgets/custom_card.dart';
import 'add_product.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key,@required this.product});

  static String id = 'HomePage';

  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(FontAwesomeIcons.caretLeft, color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {
                 
                          Navigator.pushNamed(context, AddProduct.id,arguments: product);
                      
                },
                // icon:Icon(Icons.shopping_cart),color: Colors.black,
                icon: Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                )),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('New Collection',
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
        body: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 70),
                  itemBuilder: (context, index) {
                    return StackCustomCard(product: products[index]);
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
