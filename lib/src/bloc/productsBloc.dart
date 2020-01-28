import 'package:belanja_pedia/src/model/product.dart';
import 'package:belanja_pedia/src/resources/repository.dart';

class ProductsBloc {
  int currentQuantity;
  // List<int> currentQuantity = List<int>();

  
  // createList(lengthQuantity, lengthProduct) {
  //   if(currentQuantity.length < lengthProduct) {
  //     for(int i = 0; i < lengthQuantity; i++) {
  //       currentQuantity.insert(i, 0);
  //       print(currentQuantity);
  //     }
  //   }
  //   currentQuantity.insert(lengthQuantity, 0);
  // }

  final _repository = Repository();
  Stream<List<Products>> get productsList async* {
    yield await _repository.fetchProducts();
  }

  Stream<List<Products>> get cartList async* {
    yield await _repository.getCarts('test@mail.com');
  }

  addToCart(int productId) {
    print('di product bloc $productId');
    final response = _repository.addToCart(productId);
    return response;
  }

  // currentQty(int index, int quantity) {
  //   currentQuantity[index] = quantity;
  // }

  updateQuantity(int id, String counter) {
    print('id $id dan counter $counter di productsbloc');
    final res = _repository.updateQuantity(id, counter);
    return res;
  }
}

final bloc = ProductsBloc();

