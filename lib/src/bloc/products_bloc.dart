// import 'package:belanja_pedia/src/bloc/user_bloc.dart';
import 'package:belanja_pedia/src/model/product.dart';
import 'package:belanja_pedia/src/model/user.dart';
import 'package:belanja_pedia/src/resources/repository.dart';

class ProductsBloc {
  int currentQuantity;
  int sum = 0;

  final _repository = Repository();
  Stream<List<Products>> get productsList async* {
    yield await _repository.fetchProducts();
  }

  Stream<List<Products>> getProductByCategories(String type) async* {
    yield await _repository.getProductByCategories(type);
  }

  Stream<List<Products>> cartList(email) async* {
    print('di cart bloc email: $email');
    yield await _repository.getCarts(email);
  }

  Stream<Users> userInfo(String email) async* {
    print('di product bloc');
    yield await _repository.getInfoUser(email);
  }

  addToCart(String email, int productId) {
    print('di product bloc $productId email $email');
    final response = _repository.addToCart(email, productId);
    return response;
  }

  // currentQty(int index, int quantity) {
  //   currentQuantity[index] = quantity;
  // }

  updateQuantity(String user, int id, String counter) {
    print('user $user id $id dan counter $counter di productsbloc');
    final res = _repository.updateQuantity(user, id, counter);
    return res;
  }

  total(sum) {
    return sum = sum;
  }
}

final bloc = ProductsBloc();
