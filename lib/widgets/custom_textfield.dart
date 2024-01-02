import 'package:ivy_task/exports.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.controller,
    required this.hint,
    this.isreadOnly = false,
    required this.onTap,
    super.key,
  });
  final TextEditingController controller;
  final String hint;
  final bool isreadOnly;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: TextField(
        controller: controller,
        readOnly: isreadOnly,
        onTap: () => onTap(),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(108, 117, 125, 1),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            filled: true,
            fillColor: const Color.fromRGBO(246, 247, 249, 1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
