import 'package:ivy_task/exports.dart';

class PlaceOrderScreen extends StatefulWidget {
  static const routeName = '/place-order-screen';
  const PlaceOrderScreen({super.key});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: GetBuilder<OrderController>(
        init: OrderController(),
        builder: (value) => Column(
          children: [
            SizedBox(height: height * 0.08),
            const CustomDropdownMenu(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: height * 0.15,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: value.selectedProduct == null
                  ? const Center(child: Text('No Product Selected Yet!'))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(value.selectedProduct!.imageUrl),
                        ),
                        Text(
                          value.selectedProduct!.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                value.decrement();
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Color.fromRGBO(234, 176, 27, 1),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              child: Text(value.quantity.toStringAsFixed(0)),
                            ),
                            IconButton(
                              onPressed: () {
                                value.increment();
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Color.fromRGBO(234, 176, 27, 1),
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              const TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: value.totalPrice.toStringAsFixed(0),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: height * 0.05),
            CustomButton(
              title: 'Place Order',
              onPressed: () {
                Navigator.pushNamed(context, OrderReceiptScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
