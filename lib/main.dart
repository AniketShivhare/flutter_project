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
      home: const profileOptions(),
    );
  }
}
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   var nameController = TextEditingController(text: "initial_value");
//   var phoneController = TextEditingController(text: "initial number");
//   var emailController = TextEditingController(text: "initial email");
//   var addressController = TextEditingController(text: "initial address");
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//           title: Text("Profile page"),
//         ),
//         body:  SingleChildScrollView(
//           child: Container(
//             color: Colors.white12,
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                       height:20
//                   ),
//                   const CircleAvatar(
//                     radius: 60,
//                     backgroundImage: AssetImage('assets/images/dark.jpg'),
//                   ),
//                   const SizedBox(
//                       height:40
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                               offset: Offset(0, 5),
//                               color: Colors.deepOrange.withOpacity(.2),
//                               spreadRadius: 2,
//                               blurRadius: 10
//                           )
//                         ]
//                     ),
//                     child: TextFormField(
//                       controller: nameController,
//                       validator: (value) {
//                         if(value!.length<5) {
//                           return "username length must be 5";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration: InputDecoration(
//                         labelText: 'username',
//                         hintText: '  enter username',
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 20
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                               offset: Offset(0, 5),
//                               color: Colors.deepOrange.withOpacity(.2),
//                               spreadRadius: 2,
//                               blurRadius: 10
//                           )
//                         ]
//                     ),
//                     child: TextFormField(
//                       controller: emailController,
//                       validator: (value) {
//                         if(value==null) {
//                           return "enter email";
//                         } else {
//                           return null;
//                         }
//                       },
//                       decoration:  InputDecoration(
//                         labelText: 'email',
//                         hintText: 'enter email',
//                         prefixIcon: const Icon(Icons.email),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 20
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                               offset: Offset(0, 5),
//                               color: Colors.deepOrange.withOpacity(.2),
//                               spreadRadius: 2,
//                               blurRadius: 10
//                           )
//                         ]
//                     ),
//                     child: TextFormField(
//                         controller: phoneController,
//                         decoration:  InputDecoration(
//                           labelText: 'Mobile Number',
//                           hintText: 'Enter your mobile number',
//                           prefixIcon: const Icon(Icons.phone),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0)
//                           ),
//                         ),
//                         keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (value == null) {
//                             return 'Please enter a mobile number';
//                           } else if (value.length != 10) {
//                             return "number must be 10 digit long";
//                           }
//                           return null;
//                         }
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 30
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                               offset: Offset(0, 5),
//                               color: Colors.deepOrange.withOpacity(.2),
//                               spreadRadius: 2,
//                               blurRadius: 10
//                           )
//                         ]
//                     ),
//                     child: TextFormField(
//                         controller: addressController,
//                         decoration:  InputDecoration(
//                           labelText: 'saved address here',
//                           hintText: 'Enter your Address',
//                           prefixIcon: const Icon(Icons.location_city),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0)
//                           ),
//                         ),
//                         // keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (value == null) {
//                             return 'Please enter a mobile number';
//                           } else if (value.length != 10) {
//                             return "number must be 10 digit long";
//                           }
//                           return null;
//                         }
//                     ),
//                   ),
//                   SizedBox(height:40),
//                   Container(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//
//                       },
//                       child: Text('Save Profile'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         )
//     );
//   }
// }
