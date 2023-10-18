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
import 'package:flutter_project/product_list.dart';
import 'package:flutter_project/registeration.dart';
import 'package:flutter_project/seller_googleMap.dart';
import 'package:flutter_project/seller_profile_option.dart';
import 'package:flutter_project/language_selection_page.dart';
import 'package:flutter_project/logIn_Screen.dart';
import 'package:flutter_project/logo_Screen.dart';
import 'package:flutter_project/services/User_api.dart';

import 'apis/Seller.dart';
import 'cart_screen.dart';
import 'date_selector.dart';
import 'dropdown.dart';

void main() {
  runApp(MyApp());
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF08FFC8),
        ),
        useMaterial3: true,
      ),
      home: Regest(),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class MultiSelectChipField extends StatefulWidget {
//   @override
//   _MultiSelectChipFieldState createState() => _MultiSelectChipFieldState();
// }
//
// class _MultiSelectChipFieldState extends State<MultiSelectChipField> {
//   List<String> weekdays = [
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday',
//     'Sunday'
//   ];
//   List<String> selectedWeekdays = [];
//
//   void _onChipSelected(String weekday) {
//     setState(() {
//       if (selectedWeekdays.contains(weekday)) {
//         selectedWeekdays.remove(weekday);
//       } else {
//         selectedWeekdays.add(weekday);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: weekdays.map((weekday) {
//         return ChoiceChip(
//           label: Text(weekday),
//           selected: selectedWeekdays.contains(weekday),
//           onSelected: (_) => _onChipSelected(weekday),
//         );
//       }).toList(),
//     );
//   }
// }
//
// class WeekdaySelectionScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Weekdays'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             MultiSelectChipField(),
//             SizedBox(height: 16.0),
//             Text('Selected Weekdays: ${selectedWeekdays.join(', ')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(home: WeekdaySelectionScreen()));
// }


//
// import 'package:flutter/material.dart';
//
// class MultiSelectChipField extends StatefulWidget {
//   final Function(List<String>) onSelectionChanged;
//
//   MultiSelectChipField({
//     required this.onSelectionChanged,
//   });
//
//   @override
//   _MultiSelectChipFieldState createState() => _MultiSelectChipFieldState();
// }
//
// class _MultiSelectChipFieldState extends State<MultiSelectChipField> {
//   List<String> weekdays = [
//     'Monday',
//     'Tuesday',
//     'Wednesday',
//     'Thursday',
//     'Friday',
//     'Saturday',
//     'Sunday'
//   ];
//   List<String> selectedWeekdays = [];
//
//   void _onChipSelected(String weekday) {
//     setState(() {
//       if (selectedWeekdays.contains(weekday)) {
//         selectedWeekdays.remove(weekday);
//       } else {
//         selectedWeekdays.add(weekday);
//       }
//       widget.onSelectionChanged(selectedWeekdays);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 8.0,
//       runSpacing: 4.0,
//       children: weekdays.map((weekday) {
//         return ChoiceChip(
//           label: Text(weekday),
//           selected: selectedWeekdays.contains(weekday),
//           onSelected: (_) => _onChipSelected(weekday),
//         );
//       }).toList(),
//     );
//   }
// }
//
// class WeekdaySelectionScreen extends StatefulWidget {
//   @override
//   _WeekdaySelectionScreenState createState() => _WeekdaySelectionScreenState();
// }
//
// class _WeekdaySelectionScreenState extends State<WeekdaySelectionScreen> {
//   List<String> selectedWeekdays = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Weekdays'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             MultiSelectChipField(
//               onSelectionChanged: (selectedWeekdays) {
//                 setState(() {
//                   this.selectedWeekdays = selectedWeekdays;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             Text('Selected Weekdays: ${selectedWeekdays.join(', ')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(home: WeekdaySelectionScreen()));
// }
//




