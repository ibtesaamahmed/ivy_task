import 'package:ivy_task/exports.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const ShapeDecoration(
        shape: OvalBorder(),
        color: Colors.white,
      ),
    );
  }
}
