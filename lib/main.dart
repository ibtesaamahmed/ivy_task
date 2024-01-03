import 'package:ivy_task/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IVY Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primarySwathColor,
          primaryColor: const Color.fromRGBO(234, 176, 27, 1),
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(234, 176, 27, 1)),
          useMaterial3: true,
          appBarTheme: const AppBarTheme().copyWith(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromRGBO(234, 176, 27, 1),
            centerTitle: true,
          )),
      home: const DetailsInputScreen(),
      routes: {
        PlaceOrderScreen.routeName: (context) => const PlaceOrderScreen(),
        OrderReceiptScreen.routeName: (context) => const OrderReceiptScreen(),
        OrderSuccessScreen.routeName: (context) => const OrderSuccessScreen(),
      },
    );
  }
}
