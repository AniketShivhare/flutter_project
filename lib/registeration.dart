import 'package:flutter/material.dart';
import 'package:flutter_project/user_current_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';
import 'package:geolocator_apple/geolocator_apple.dart';
import 'package:day_picker/day_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'apis/sellerModel.dart';
import 'bankDetails.dart';
import 'dropdown.dart';
import 'package:multiselect/multiselect.dart';
import 'package:flutter_project/shopTime_weekDays_class.dart';
import 'package:flutter_project/dialog_of_registration.dart';

bool food_present=false;

List<TextEditingController> other_phoneNo_controllers = [];
List<TextEditingController> other_Landline_controllers = [];


class Regest extends StatefulWidget {
  const Regest({super.key});

  @override
  _SellerRegistrationPageState createState() => _SellerRegistrationPageState();
}

class _SellerRegistrationPageState extends State<Regest> {

  final _formKey = GlobalKey<FormState>();

  late String _shop_name;

  TextEditingController shopNameController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController landlineNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shopTimingController = TextEditingController();


  late String lat, long;
  late String msg;
  Color customColor =  const Color(0xFFDEDC07);

  // static get isSelected => null;

  // CurrentLocationScreen currentLocationScreen = CurrentLocationScreen();


  Future<Position?> _getCurrentLocation() async {
    print("sdfsdfsd");
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, handle accordingly
      print("dfdfd");
      return null;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {// Permission is still denied, handle accordingly
        return null;
      }
    }
    // Get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high, // Set desired accuracy
      );
      return position;
    } catch (e) {
      // Handle errors that may occur while fetching the location
      return null;
    }
  }
  Future<void> postPersonalDetails() async {

    UpdateSeller seller = UpdateSeller(
      shopName: shopNameController.text,
      ownerName: ownerNameController.text,
      phone: mobileNoController.text,
      landlineNumber: landlineNoController.text,
      addressOfShop: addressController.text,
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetailsForm(seller:seller)));

  }
  bool dia = false;

  List<Widget> uiPhone = [];
  void addNewPhoneNo (){
    var mobileNoController = TextEditingController();
    other_phoneNo_controllers.add(mobileNoController);

    setState(() {
      uiPhone.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              controller: mobileNoController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: ' Enter mobile number',
              ),
            ),
            SizedBox(height: 16,)
          ],
        )

      );
    });
  }


  List<Widget> uiLandline = [];
  void addNewLandline (){
    var landlineNoController = TextEditingController();
    other_Landline_controllers.add(landlineNoController);
    setState(() {
      uiLandline.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextFormField(
                controller: landlineNoController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: ' Enter landline number (optional)',
                ),
              ),
              SizedBox(height: 16,)
            ],
          )

      );
    });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Basic Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {

          },
          icon: const Icon(Icons.arrow_back),
        ),

        elevation: 20,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            border: Border.all(
                              color: Colors.cyanAccent,
                              width: 2.0, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('1',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 90,
                        decoration:  BoxDecoration(
                          color: customColor,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            color: customColor,
                            border: Border.all(
                              color: customColor,
                              width: 2.0, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('2',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 90,
                        decoration:  BoxDecoration(
                          color: customColor,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        // color: Colors.cyanAccent,
                        decoration: BoxDecoration(
                            color: customColor,
                            border: Border.all(
                              color: customColor,
                              width: 2.0, // Adjust border width as needed
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Text('3',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      'Shop Name',
                      style: TextStyle(fontSize: 18,),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(fontSize: 18,color: Colors.red),
                    ),
                  ],
                ),

                TextFormField(
                  controller: shopNameController,
                  decoration: const InputDecoration(
                    hintText: ' Enter shop name',
                  ),

                  onChanged: (value) {
                    setState(() {
                      // Update the error text when the user types
                      _formKey.currentState?.validate();
                    });
                  },

                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Please enter shop name';
                    }
                    return null;
                  },


                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Text(
                      'Owner Name',
                      style: TextStyle(fontSize: 18,),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(fontSize: 18,color: Colors.red),
                    ),
                  ],
                ),
                TextFormField(
                  controller: ownerNameController,
                  decoration: const InputDecoration(
                    hintText: ' Enter owner name',
                  ),
                  onChanged: (value) {
                    setState(() {
                      // Update the error text when the user types
                      _formKey.currentState?.validate();
                    });
                  },

                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Please enter owner name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Text(
                      'Mobile No.',
                      style: TextStyle(fontSize: 18,),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(fontSize: 18,color: Colors.red),
                    ),
                  ],
                ),
                TextFormField(
                  controller: mobileNoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: ' Enter mobile number',
                  ),
                  onChanged: (value) {
                    setState(() {
                      // Update the error text when the user types
                      _formKey.currentState?.validate();
                    });
                  },

                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Please enter Mobile No.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                Column(children: uiPhone),
                const SizedBox(height: 5),
                ElevatedButton(onPressed: addNewPhoneNo, child: Text('Add another Mobile')),

                const SizedBox(height: 16),

                Row(
                  children: [
                    const Text(
                      'Landline No.',
                      style: TextStyle(fontSize: 18,),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(fontSize: 18,color: Colors.red),
                    ),
                  ],
                ),
                TextFormField(
                  controller: landlineNoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: ' Enter landline number (optional)',
                  ),
                  onChanged: (value) {
                    setState(() {
                      // Update the error text when the user types
                      _formKey.currentState?.validate();
                    });
                  },

                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Please enter Landline No.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                Column(children: uiLandline),
                const SizedBox(height: 5),
                ElevatedButton(onPressed: addNewLandline, child: Text('Add another Landline')),

                const SizedBox(height: 16),

                Row(
                  children: [
                    const Text(
                      'Address',
                      style: TextStyle(fontSize: 18,),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(fontSize: 18,color: Colors.red),
                    ),
                  ],
                ),
                TextFormField(
                  controller: addressController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: ' Enter address',
                  ),
                  onChanged: (value) {
                    setState(() {
                      // Update the error text when the user types
                      _formKey.currentState?.validate();
                    });
                  },

                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Please enter Address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                // ElevatedButton(onPressed: () async {
                //   _getCurrentLocation().then((value) {
                //     lat = '${value?.latitude}';
                //     long = '${value?.longitude}';
                //     setState(() {
                //       msg = 'lat:$lat, long:$long';
                //       print(msg);
                //     });
                //   });
                // },
                //   style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
                //   ),
                //   child: const Text('Save my current location',
                //     ),
                // ),


               // const SizedBox(height: 32),
                //
                // Container(
                //   child: ElevatedButton(
                //     child: Text('current location'),
                //     onPressed: ()=> CurrentLocationScreen(),
                //     style: ButtonStyle(
                //         backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
                //     ),
                //   ),
                // ),

                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                    return const GetUserCurrentLocationScreen();
                  }));
                }, child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Save My current location"),
                      const Text(
                        '*',
                        style: TextStyle(fontSize: 18,color: Colors.red),
                      ),
                    ],
                  ),
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
      ),
                ),





                const SizedBox(height: 32),
                Container(
                  child: ElevatedButton(
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Shop Time'),
                        const Text(
                          '*',
                          style: TextStyle(fontSize: 18,color: Colors.red),
                        ),
                      ],
                    ),
                    onPressed: (){
                      showDialog(context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context){
                            return SimpleCustomAlert();
                          }
                          );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                dropDown(initialValue:food_present,
                updateInitialValue: (value) {
                  setState(() {
                    food_present = value;
                  });
                }),
                const SizedBox(height: 32),
                dropDown2(),
                const SizedBox(height: 32),
                // if(food_present)
                //   { foodInformation() };


                food_present ? foodInformation() : Container(),


                // foodInformation(),


                Container(
                  width: double.infinity,
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade300)

                      ),
                      onPressed: (){

                        if(_formKey.currentState!.validate() || true){
                          print('success');
                          postPersonalDetails();
                        }

                       },
                        child: const Text('Register')

                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );



  }


  // Future<LocationPermission> _requestLocationPermission() async {
  //   LocationPermission permission = await Geolocator.requestPermission();
  //   return permission;
  // }




}




















