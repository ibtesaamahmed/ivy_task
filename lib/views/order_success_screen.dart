import 'package:ivy_task/exports.dart';

class OrderSuccessScreen extends StatelessWidget {
  static const routeName = '/order-success-screen';

  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Completed'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/order_success_icon.png'),
                const Positioned.fill(
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 60,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Order Completed!',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
