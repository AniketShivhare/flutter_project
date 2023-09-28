// import 'package:flutter/material.dart';
// import 'package:flutter_project/cart_screen.dart';
// import 'package:flutter_project/product_list.dart';
// import 'package:flutter_project/logIn_Screen.dart';
// import 'package:flutter_project/seller_profile_personalDetails.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
//         useMaterial3: true,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_project/registeration.dart';
import 'package:flutter_project/seller_profile_option.dart';
import 'package:flutter_project/language_selection_page.dart';
import 'package:flutter_project/logIn_Screen.dart';
import 'package:flutter_project/logo_Screen.dart';
import 'package:flutter_project/services/User_api.dart';

import 'apis/Seller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF08FFC8),),
        useMaterial3: true,
      ),
      home: Regest(),
    );
  }
}



//
// import 'package:day_picker/day_picker.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final List<DayInWeek> _days = [
//     DayInWeek("Mon", dayKey: "monday"),
//     DayInWeek("Tue", dayKey: "tuesday"),
//     DayInWeek("Wed", dayKey: "wednesday"),
//     DayInWeek("Thu", dayKey: "thursday"),
//     DayInWeek("Fri", dayKey: "friday"),
//     DayInWeek("Sat", dayKey: "saturday", isSelected: true),
//     DayInWeek("Sun", dayKey: "sunday", isSelected: true),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final customWidgetKey = new GlobalKey<SelectWeekDaysState>();
//
//     SelectWeekDays selectWeekDays = SelectWeekDays(
//       key: customWidgetKey,
//       fontSize: 14,
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
//         title: Text("Select days in week"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: SelectWeekDays(
//           //     fontSize: 14,
//           //     fontWeight: FontWeight.w500,
//           //     days: _days,
//           //     onSelect: (values) {
//           //       print(values);
//           //     },
//           //   ),
//           // ),
//
//
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: SelectWeekDays(
//           //     width: MediaQuery.of(context).size.width / 2,
//           //     fontSize: 14,
//           //     fontWeight: FontWeight.w500,
//           //     days: _days,
//           //     border: false,
//           //     boxDecoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(30.0),
//           //       gradient: LinearGradient(
//           //         begin: Alignment.topLeft,
//           //         // 10% of the width, so there are ten blinds.
//           //         colors: [
//           //           const Color(0xFFE55CE4),
//           //           const Color(0xFFBB75FB)
//           //         ], // whitish to gray
//           //         tileMode:
//           //         TileMode.repeated, // repeats the gradient over the canvas
//           //       ),
//           //     ),
//           //     onSelect: (values) {
//           //       print(values);
//           //     },
//           //   ),
//           // ),
//
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SelectWeekDays(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               days: _days,
//               boxDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30.0),
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   // 10% of the width, so there are ten blinds.
//                   colors: [
//                     const Color(0xFFE55CE4),
//                     const Color(0xFFBB75FB)
//                   ], // whitish to gray
//                   tileMode:
//                   TileMode.repeated, // repeats the gradient over the canvas
//                 ),
//               ),
//               onSelect: (values) {
//                 print(values);
//               },
//             ),
//           ),
//
//
//           // SelectWeekDays(
//           //   fontSize: 14,
//           //   fontWeight: FontWeight.w500,
//           //   days: _days,
//           //   backgroundColor: Color(0xFF303030),
//           //   onSelect: (values) {
//           //     print(values);
//           //   },
//           // ),
//
//
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: SelectWeekDays(
//           //     fontSize: 14,
//           //     fontWeight: FontWeight.w500,
//           //     days: _days,
//           //     border: false,
//           //     backgroundColor: Color(0xFF303030),
//           //     onSelect: (values) {
//           //       print(values);
//           //     },
//           //   ),
//           // ),
//
//
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: selectWeekDays,
//               ),
//               Container(
//                 color: Colors.green.withOpacity(0.4),
//                 child: TextButton(
//                   onPressed: () {
//                     List<DayInWeek> offAllDays =
//                     List.from(_days.map((e) => e..isSelected = false));
//                     customWidgetKey.currentState?.setDaysState(offAllDays);
//                   },
//                   child: Text('Days off'),
//                 ),
//               ),
//             ],
//           ),
//
//
//
//         ],
//       ),
//     );
//   }
// }