import 'package:ivy_task/exports.dart';

class CustomReceipt extends StatelessWidget {
  const CustomReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final ordersProvider = Provider.of<OrdersProvider>(context, listen: false);

    return Stack(
      children: [
        Container(
          height: height * 0.5,
          width: width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(234, 176, 27, 1),
                Color.fromRGBO(162, 116, 0, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Receipt',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Center(
                  child: Text(
                    '${ordersProvider.totalPrice.toStringAsFixed(0)} USD',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 46,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: const DottedLine(
                    color: Colors.white,
                    axisDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: height * 0.04),
                Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 226, 225, 225),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            ordersProvider.selectedProduct!.imageUrl),
                      ),
                      Row(
                        children: [
                          Text(
                            ordersProvider.selectedProduct!.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                              'x ${ordersProvider.quantity.toStringAsFixed(0)}'),
                        ],
                      ),
                      Text(
                        '${ordersProvider.quantity.toStringAsFixed(0)} x ${ordersProvider.selectedProduct!.price.toStringAsFixed(0)} = \$${ordersProvider.totalPrice}',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.16,
          bottom: height * 0.3,
          left: -10,
          child: const CustomCircle(),
        ),
        Positioned(
          top: height * 0.16,
          bottom: height * 0.3,
          right: -10,
          child: const CustomCircle(),
        ),
        Positioned(
          top: height * 0.02,
          left: width * 0.05,
          child: const Row(
            children: [
              Icon(
                Icons.star,
                size: 23,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Icon(
                  Icons.circle,
                  size: 6,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: height * 0.03,
          left: width * 0.1,
          child: const Icon(
            Icons.star,
            color: Colors.white,
            size: 12,
          ),
        ),
        Positioned(
          bottom: height * 0.04,
          right: width * 0.1,
          child: const Icon(
            Icons.star,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
