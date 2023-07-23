

import '../helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    // http.Response response = await http
    //     .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

      // List<dynamic> data = jsonDecode(response.body);

      return data;
   
  }
}
