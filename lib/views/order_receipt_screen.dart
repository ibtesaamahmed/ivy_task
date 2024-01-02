import 'package:ivy_task/exports.dart';

class OrderReceiptScreen extends StatelessWidget {
  static const routeName = '/order-receipt-screen';
  const OrderReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Order'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.08),
            const CustomReceipt(),
            SizedBox(height: height * 0.05),
            CustomButton(
              title: 'Confirm',
              onPressed: () {
                Navigator.pushNamed(context, OrderSuccessScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
