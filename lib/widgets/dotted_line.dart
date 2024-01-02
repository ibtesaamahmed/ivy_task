import 'package:ivy_task/exports.dart';

class DottedLine extends StatelessWidget {
  const DottedLine(
      {Key? key,
      this.height = 1,
      required this.axisDirection,
      this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;
  final Axis axisDirection;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: axisDirection,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
