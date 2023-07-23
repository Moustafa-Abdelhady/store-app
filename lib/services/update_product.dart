import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String desc,
    required String image,
    required int id,
    required String category,
  }) async {
    print('product id = $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
      // token: token
    );

    return ProductModel.fromJson(data);
  }
}
