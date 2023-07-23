import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        HomePage.id :(context) =>  HomePage(),
        UpdateProductPage.id :(context) =>  UpdateProductPage(),
        AddProduct.id :(context) => AddProduct(),
      } ,
    initialRoute:HomePage.id,
    );
  }
}