import 'package:ivy_task/exports.dart';

class SetAddressBottomSheet extends StatefulWidget {
  const SetAddressBottomSheet({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;

  @override
  State<SetAddressBottomSheet> createState() => _SetAddressBottomSheetState();
}

class _SetAddressBottomSheetState extends State<SetAddressBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: height * 0.35,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              GooglePlaceAutoCompleteTextField(
                textEditingController: _searchController,
                isCrossBtnShown: false,
                googleAPIKey: googleMapApiKey,
                boxDecoration: const BoxDecoration(),
                inputDecoration: InputDecoration(
                  hintText: 'Search Address',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  suffixIcon: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black54,
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(246, 247, 249, 1),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                itemClick: (postalCodeResponse) =>
                    setAddress(context, postalCodeResponse.description!),
                itemBuilder: (context, index, prediction) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prediction.structuredFormatting!.mainText ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          prediction.structuredFormatting!.secondaryText ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  final _searchController = TextEditingController();

  void setAddress(BuildContext context, String address) {
    widget.controller.text = address;
    Navigator.pop(context);
  }
}
