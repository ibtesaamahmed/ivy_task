import 'package:ivy_task/exports.dart';

// class OrdersProvider with ChangeNotifier {
//   final List<Product> _products = [
//     Product(
//       title: 'Black Shoes',
//       description: 'A pair of stylish black shoes',
//       price: 25,
//       imageUrl:
//           'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7b6b8921-d2de-4c65-9c08-0c22dcb9a30a/court-vision-low-shoes-cjNZXt.png',
//     ),
//     Product(
//       title: 'Red T-shirt',
//       description: 'A stylish Red T-shirt',
//       price: 12,
//       imageUrl:
//           'https://engine.com.pk/cdn/shop/products/TT3087-RED_2.jpg?v=1689679393',
//     ),
//     Product(
//       title: 'Blue Jeans',
//       description: 'A stylish blue jeans',
//       price: 18,
//       imageUrl: 'https://eddyz.pk/cdn/shop/files/62.jpg?v=1695376088',
//     ),
//     Product(
//       title: 'Yellow Cap',
//       description: 'A stylish yellow cap',
//       price: 8,
//       imageUrl:
//           'https://img.freepik.com/premium-vector/yellow-cap-mockup-realistic-style-vector-illustration_595175-75.jpg',
//     ),
//     Product(
//       title: 'Grey Scarf',
//       description: 'A stylish grey scarf',
//       price: 5,
//       imageUrl:
//           'https://outfitters.com.pk/cdn/shop/files/F0048118915_1.jpg?v=1683530784',
//     ),
//   ];
//   List<Product> get products => _products;

//   Product? selectedProduct;
//   double quantity = 0;
//   double totalPrice = 0;

//   void selectProduct(Product currentProduct) {
//     quantity = 0;
//     totalPrice = 0;
//     selectedProduct = currentProduct;
//     notifyListeners();
//   }

//   void increment() {
//     quantity++;
//     totalPrice = selectedProduct!.price * quantity;
//     notifyListeners();
//   }

//   void decrement() {
//     if (quantity == 0) {
//       return;
//     }
//     quantity--;
//     totalPrice = selectedProduct!.price * quantity;
//     notifyListeners();
//   }
// }

class OrderController extends GetxController {
  final List<Product> _products = [
    Product(
      title: 'Black Shoes',
      description: 'A pair of stylish black shoes',
      price: 25,
      imageUrl:
          'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7b6b8921-d2de-4c65-9c08-0c22dcb9a30a/court-vision-low-shoes-cjNZXt.png',
    ),
    Product(
      title: 'Red T-shirt',
      description: 'A stylish Red T-shirt',
      price: 12,
      imageUrl:
          'https://engine.com.pk/cdn/shop/products/TT3087-RED_2.jpg?v=1689679393',
    ),
    Product(
      title: 'Blue Jeans',
      description: 'A stylish blue jeans',
      price: 18,
      imageUrl: 'https://eddyz.pk/cdn/shop/files/62.jpg?v=1695376088',
    ),
    Product(
      title: 'Yellow Cap',
      description: 'A stylish yellow cap',
      price: 8,
      imageUrl:
          'https://img.freepik.com/premium-vector/yellow-cap-mockup-realistic-style-vector-illustration_595175-75.jpg',
    ),
    Product(
      title: 'Grey Scarf',
      description: 'A stylish grey scarf',
      price: 5,
      imageUrl:
          'https://outfitters.com.pk/cdn/shop/files/F0048118915_1.jpg?v=1683530784',
    ),
  ];
  List<Product> get products => _products;

  Product? selectedProduct;
  double quantity = 0;
  double totalPrice = 0;
  void selectProduct(Product currentProduct) {
    quantity = 0;
    totalPrice = 0;
    selectedProduct = currentProduct;
    update();
  }

  void increment() {
    quantity++;
    totalPrice = selectedProduct!.price * quantity;
    update();
  }

  void decrement() {
    if (quantity == 0) {
      return;
    }
    quantity--;
    totalPrice = selectedProduct!.price * quantity;
    update();
  }
}
