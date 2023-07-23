
import '../models/product_model.dart';
import '../helper/api.dart'; 

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    // http.Response response =
    //     await http.get(Uri.parse('https://fakestoreapi.com/products'));

    ///Api from class api to get clean code
   List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');

   
      // List<dynamic> data = jsonDecode(response.body);
      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(
          ProductModel.fromJson(data[i]),
        );
      }
      return productList;
   
  }
}
