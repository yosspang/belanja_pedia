import 'package:belanja_pedia/src/model/product.dart';
import 'package:belanja_pedia/src/resources/repository.dart';

class ProductsBloc {
  final _repository = Repository();
  Stream<List<Products>> get productsList async* {
    yield await _repository.fetchProducts();
  }
}
