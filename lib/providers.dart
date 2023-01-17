import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/cat_facts/models/cat_fact_model.dart';
import 'package:riverpod_example/networking/cat_fact_services.dart';

final catFactProvider = StateNotifierProvider<CatFactController, AsyncValue<CatFactModel?>>((ref) {
  return CatFactController(services: CatFactServices());
});

class CatFactController extends StateNotifier<AsyncValue<CatFactModel?>> {
  final CatFactServices services;
  CatFactController({required this.services}) : super(const AsyncValue.data(null));

  Future<void> getCatFact() async {
    try {
      state = const AsyncValue.loading();
      final catFact = await services.getCatFact();
      state = AsyncValue.data(catFact);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
