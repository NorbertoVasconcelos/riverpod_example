import 'package:riverpod_example/cat_facts/models/cat_fact_model.dart';
import 'package:riverpod_example/networking/network_helper.dart';

class CatFactServices {
  Future<CatFactModel> getCatFact() async {
    try {
      final response = await NetworkHelper.shared.get('/fact');
      return CatFactModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
