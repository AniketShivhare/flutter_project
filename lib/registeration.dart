// import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geolocator_android/geolocator_android.dart';
// import 'package:geolocator_apple/geolocator_apple.dart';
// import 'package:day_picker/day_picker.dart';
//
//
// class Regest extends StatefulWidget {
//   const Regest({super.key});
//
//   @override
//   _SellerRegistrationPageState createState() => _SellerRegistrationPageState();
// }
//
// class _SellerRegistrationPageState extends State<Regest> {
//   TextEditingController shopNameController = TextEditingController();
//   TextEditingController ownerNameController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController landlineNoController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController shopTimingController = TextEditingController();
//
//
//
//     final List<DayInWeek> _days = [
//     DayInWeek("Mon", dayKey: "monday"),
//     DayInWeek("Tue", dayKey: "tuesday"),
//     DayInWeek("Wed", dayKey: "wednesday"),
//     DayInWeek("Thu", dayKey: "thursday"),
//     DayInWeek("Fri", dayKey: "friday"),
//     DayInWeek("Sat", dayKey: "saturday"),
//     DayInWeek("Sun", dayKey: "sunday"),
//   ];
//   //
//   // bool isSelected;
//   // ListView.builder(List<DayInWeek> _days, this.isSelected) :
// // final List<DayInWeek> _day = _days.where((DayTnWeek) => isSelected == true).toList();
//
//
//   late String lat, long;
//   late String msg;
//   Color customColor =  const Color(0xFFDEDC07);
//
//   // static get isSelected => null;
//
//
//   Future<Position?> _getCurrentLocation() async {
//     print("sdfsdfsd");
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled, handle accordingly
//       print("dfdfd");
//       return null;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permission is still denied, handle accordingly
//         return null;
//       }
//     }
//     // Get the current location
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high, // Set desired accuracy
//       );
//       return position;
//     } catch (e) {
//       // Handle errors that may occur while fetching the location
//       return null;
//     }
//   }
//   Future<void> postPersonalDetails() async {
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     final customWidgetKey = GlobalKey<SelectWeekDaysState>();
//
//     SelectWeekDays selectWeekDays = SelectWeekDays(
//       key: customWidgetKey,
//       fontSize: 10,
//       fontWeight: FontWeight.w500,
//       days: _days,
//       border: false,
//       width: MediaQuery.of(context).size.width / 1.4,
//       boxDecoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(30.0),
//       ),
//       onSelect: (values) {
//         print(values);
//       },
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         title: const Text('Basic Details'),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//         // bottom: TabBar(
//         //   tabs: [
//         //     Tab(
//         //
//         //     )
//         //   ],
//         // ),
//         elevation: 20,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(left:40.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 30,
//                       width: 30,
//                       // color: Colors.cyanAccent,
//                       decoration: BoxDecoration(
//                           color: Colors.cyanAccent,
//                           border: Border.all(
//                             color: Colors.cyanAccent,
//                             width: 2.0, // Adjust border width as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Center(
//                         child: Text('1',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 1.0,
//                       width: 120,
//                       decoration:  BoxDecoration(
//                         color: customColor,
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 30,
//                       // color: Colors.cyanAccent,
//                       decoration: BoxDecoration(
//                           color: customColor,
//                           border: Border.all(
//                             color: customColor,
//                             width: 2.0, // Adjust border width as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Center(
//                         child: Text('2',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: 1.0,
//                       width: 120,
//                       decoration:  BoxDecoration(
//                         color: customColor,
//                       ),
//                     ),
//                     Container(
//                       height: 30,
//                       width: 30,
//                       // color: Colors.cyanAccent,
//                       decoration: BoxDecoration(
//                           color: customColor,
//                           border: Border.all(
//                             color: customColor,
//                             width: 2.0, // Adjust border width as needed
//                           ),
//                           borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: const Center(
//                         child: Text('3',
//                           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Text(
//                 'Shop Name',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               TextFormField(
//                 controller: shopNameController,
//                 decoration: const InputDecoration(
//                   hintText: ' Enter shop name',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Owner Name',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               TextFormField(
//                 controller: ownerNameController,
//                 decoration: const InputDecoration(
//                   hintText: ' Enter owner name',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Mobile No.',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               TextFormField(
//                 controller: mobileNoController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   hintText: ' Enter mobile number',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Landline No.',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               TextFormField(
//                 controller: landlineNoController,
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(
//                   hintText: ' Enter landline number (optional)',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Address',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               TextFormField(
//                 controller: addressController,
//                 maxLines: null,
//                 decoration: const InputDecoration(
//                   hintText: ' Enter address',
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(onPressed: () async {
//                 _getCurrentLocation().then((value) {
//                   lat = '${value?.latitude}';
//                   long = '${value?.longitude}';
//                   setState(() {
//                     msg = 'lat:$lat, long:$long';
//                     print(msg);
//                   });
//                 });
//               },
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
//                 ),
//                 child: const Text('Save my current location',
//                   style: TextStyle(
//                       color: Colors.black
//                   ),),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Shop OFF Days',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               const SizedBox(height: 5),
//
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: SelectWeekDays(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       days: _days,
//                       boxDecoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30.0),
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           // 10% of the width, so there are ten blinds.
//                           colors: [
//                             const Color(0xccff0000),
//                             const Color(0xFFff0000)
//                           ], // whitish to gray
//                           tileMode:
//                           TileMode.repeated, // repeats the gradient over the canvas
//                         ),
//                       ),
//                       onSelect: (values) {
//                         print(values);
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 12,),
//
//                   Container(
//                     color: Colors.green.withOpacity(0.4),
//                     child: TextButton(
//                       onPressed: () {
//                         List<DayInWeek> offAllDays =
//                         List.from(_days.map((e) => e..isSelected = false));
//                         customWidgetKey.currentState?.setDaysState(offAllDays);
//                       },
//                       child: Text('Days off'),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//
//               const Text(
//                 'Shop Timing',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               TextFormField(
//                 controller: shopTimingController,
//                 decoration: const InputDecoration(
//                   hintText: ' Enter shop timing',
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//               const Text(
//                 'Select Days for Same Shop Timing',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               const SizedBox(height: 5),
//
//               Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: SelectWeekDays(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   days: _days,
//                   boxDecoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30.0),
//                     gradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       // 10% of the width, so there are ten blinds.
//                       colors: [
//                         const Color(0xFFE55CE4),
//                         const Color(0xFFBB75FB)
//                       ], // whitish to gray
//                       tileMode:
//                       TileMode.repeated, // repeats the gradient over the canvas
//                     ),
//                   ),
//                   onSelect: (values) {
//                     print(values);
//                   },
//                 ),
//               ),
//               const SizedBox(height: 32),
//
//               Container(
//                 child: ElevatedButton(
//                   child: Text('Shop Time'),
//                   onPressed: (){
//                     showDialog(context: context,
//                         builder: (BuildContext context){
//                           return SimpleCustomDialog();
//                         }
//                         );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 32),
//               Container(
//                 width: double.infinity,
//                 child: Center(
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                         minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
//                     ),
//                     onPressed: postPersonalDetails,
//                     child: const Text('Register'),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//
//
//     void showCustomDialog(BuildContext context) => showDialog(
//       context: context,
//       barrierDismissible: false,
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 12),
//               Text(
//                 'This is a Custom Dialog',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(height: 12),
//               Text(
//                 'You get more customisation freedom in this type of dialogs',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 20),
//               ),
//               SizedBox(height: 12),
//               ElevatedButton(
//                 child: Text('Close'),
//                 onPressed: () => Navigator.of(context).pop(),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//
//
//   }
// }
//
//
//
//
//
//
