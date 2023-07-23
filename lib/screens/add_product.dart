import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';

import '../services/add_product.dart';
import '../services/update_product.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddProduct extends StatefulWidget {
  AddProduct({
    super.key,
  });

  static String id = 'AddProduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? prodName, desc, img , price, category;


  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // ProductModel product =
    //     ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          elevation: .1,
          centerTitle: true,
          title: Text(
            'Add Products',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                CustomTextField(
                  onChanged: (data) {
                    prodName = data;
                  },
                  hintText: 'Product Name',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'description',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'price',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  onChanged: (data) {
                    img = data;
                  },
                  hintText: 'image',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                CustomTextField(
                   onChanged: (data) {
                    category = data;
                  },
                  hintText: 'category',
                  obscureText: false,
                ),
                SizedBox(height: 40),
                CustomButton(
                  text: 'Add',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                     await AddProductFunc();
                      print('Added successfully');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> AddProductFunc() async {
   await AddProductService().addProduct (
      title:  prodName!,
      price: (price!),
      desc: desc!,
      image: img!,
      category:category!,
    );
  }
}
