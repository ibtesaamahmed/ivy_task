import 'package:ivy_task/exports.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);

    return DropdownButtonFormField<Product>(
      padding: const EdgeInsets.all(20),
      value: ordersProvider.selectedProduct,
      decoration: InputDecoration(
        labelText: 'Select a Product',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      items: ordersProvider.products.map((product) {
        return DropdownMenuItem<Product>(
          value: product,
          child: Text(product.title),
        );
      }).toList(),
      onChanged: (value) {
        ordersProvider.selectProduct(value!);
      },
    );
  }
}
