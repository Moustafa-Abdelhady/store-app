import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/update_product.dart';

class StackCustomCard extends StatelessWidget {
   StackCustomCard({
    super.key,required this.product,
  });

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () { 
                          Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
                        },
      child: Stack(
        ///stack >>help us to put image or widget above another widget
        ///and to move it we must put image in positioned widget and use direction right/left
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.2),
                  blurRadius: 7,
                  spreadRadius: 4,
                  offset: Offset(4, 4))
            ]),
            // height: 130,
            // width:220,
            child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(product.title!.substring(0,18),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        // mainAxisSize: MainAxisSize.max, //it takes some space it's good and work
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$''${product.price}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
          ),
          Positioned(
              bottom: 100,
              right: 5,
              child: Image.network(
                product.image!,
                height: 90,
                width:100,
              ))
        ],
      ),
    );
  }
}
