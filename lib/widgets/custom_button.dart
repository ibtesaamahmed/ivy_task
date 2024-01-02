import 'package:ivy_task/exports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(234, 176, 27, 1)),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
