
import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';

class CategoryService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    // http.Response response = await http.get(
    //     Uri.parse('https://fakestoreapi.com/products/category/$categoryName'));

    List<dynamic> data = await Api().get(
        url: 'https://fakestoreapi.com/products/category/$categoryName');

    // if (response.statusCode == 200) {
      // List<dynamic> data = jsonDecode(response.body);

      List<ProductModel> categoryProducts = [];

      for (int i = 0; i < data.length; i++) {
        categoryProducts.add(ProductModel.fromJson(data[i]));
      }
      return categoryProducts;
    // } else {
    //   throw Exception(
    //       'there is a problem with statusCode ${response.statusCode}');
    // }
  }
}
