import 'package:ivy_task/exports.dart';

class DetailsInputScreen extends StatefulWidget {
  const DetailsInputScreen({super.key});

  @override
  State<DetailsInputScreen> createState() => _DetailsInputScreenState();
}

class _DetailsInputScreenState extends State<DetailsInputScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: height * 0.1),
              Image.asset(
                'assets/images/shopping_icon.png',
                fit: BoxFit.cover,
                scale: 3 / 2,
              ),
              CustomTextfield(
                onTap: () {},
                controller: nameController,
                hint: 'Name',
              ),
              SizedBox(height: height * 0.02),
              CustomTextfield(
                onTap: () {
                  showAddressBottomSheet(addressController);
                },
                controller: addressController,
                hint: 'Address',
                isreadOnly: true,
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Choosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      style: const TextStyle(
                        color: Color.fromRGBO(108, 117, 125, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: openDatePicker,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isLocationEnabled
                        ? const Text(
                            'Current Location Available!',
                            style: TextStyle(color: Colors.green),
                          )
                        : Text(
                            'Current Location not Available!',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.error),
                          ),
                    ElevatedButton(
                      onPressed:
                          isLocationEnabled ? null : () => _requestPermission(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      child: const Text('Get Location'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              CustomButton(
                onPressed: _submitData,
                title: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }

  DateTime? _selectedDate;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  bool isLocationEnabled = false;
  Position? currentPosition;

  @override
  void initState() {
    super.initState();
    _checkPermissionAndFetchLocation();
  }

  void showAddressBottomSheet(TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      elevation: 10,
      builder: (BuildContext context) {
        return SetAddressBottomSheet(
          controller: controller,
        );
      },
    );
  }

  void openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        _selectedDate == null ||
        isLocationEnabled == false) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'An Error Occured',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          content: const Text(
            'Missing Fields',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                )),
          ],
        ),
      );
    } else {
      Navigator.pushNamed(context, PlaceOrderScreen.routeName);
    }
  }

  Future<void> _checkPermissionAndFetchLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      await _getCurrentLocation();
      setState(() {
        isLocationEnabled = true;
      });
    }
  }

  Future<void> _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        isLocationEnabled = true;
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentPosition = position;
      });
    } catch (e) {
      throw ("Error: $e");
    }
  }
}
