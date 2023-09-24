import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class LogoScreen extends StatefulWidget {
  const LogoScreen({super.key});

  @override
  _LogoScreenState createState() => _LogoScreenState();
}



class _LogoScreenState extends State<LogoScreen> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration:
                // BoxDecoration(
                //   color: Colors.white
                // ),

                BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          // Color(0x665ac18e),
                          // Color(0x995ac18e),
                          // Color(0xcc5ac18e),
                          // Color(0xff5ac18e),
                          // Color(0x6608FFC8),
                          // Color(0x9908FFC8),
                          // Color(0xcc08FFC8),
                          // Color(0xff08FFC8),

                          Color(0x66FFA500),
                          Color(0x99FFA500),
                          Color(0xccFFA500),
                          Color(0xffFFA500),


                        ]
                    )
                ),

                child:Center(
                  child: Image.asset(
                    "assets/images/Transparent hindi logo.png",
                    height: 60,
                    width: 180,
                  ),
                ),

                // child: SingleChildScrollView(
                //   physics: AlwaysScrollableScrollPhysics(),
                //   padding: EdgeInsets.symmetric(
                //       horizontal: 25,
                //       vertical: 120
                //   ),
                //
                //
                //
                //   // Column(
                //   //   mainAxisAlignment: MainAxisAlignment.center,
                //   //   crossAxisAlignment: CrossAxisAlignment.center,
                //   //   children: <Widget>[
                //   //     // SizedBox(height: 150,),
                //   //     // // Text(
                //   //     // //   "India's HyperLocal Dukan",
                //   //     // //   style: GoogleFonts.sourceSansPro(
                //   //     // //       color: Color(0xFFD10000),
                //   //     // //       fontSize: 23,
                //   //     // //       fontWeight: FontWeight.bold,
                //   //     // //
                //   //     // //   ),
                //   //     // // ),
                //   //     //
                //   //     // SizedBox(height: 15,),
                //   //     Center(
                //   //       child: Image.asset(
                //   //         "assets/images/Transparent hindi logo.png",
                //   //         height: 60,
                //   //         width: 180,
                //   //       ),
                //   //     ),
                //   //
                //   //     // SizedBox(height: 50,),
                //   //     // buildEmail(),
                //   //     // SizedBox(height: 20,),
                //   //     // buildPassword(),
                //   //     // buildForgotPassBtn(),
                //   //
                //   //
                //   //     // Padding(
                //   //     //   padding: const EdgeInsets.only(left: 38.0),
                //   //     // Column(
                //   //     //   mainAxisAlignment: MainAxisAlignment.start,
                //   //     //   crossAxisAlignment: CrossAxisAlignment.start,
                //   //     //   children: [
                //   //     //     SizedBox(height: 50,),
                //   //     //     Container(
                //   //     //       height: 50,
                //   //     //       width: 220,
                //   //     //       child: ElevatedButton(
                //   //     //         onPressed:() {
                //   //     //           // Navigator.push(
                //   //     //           //   context,
                //   //     //           //   MaterialPageRoute(
                //   //     //           //       builder: (context) => MyHomePage()),
                //   //     //           // );
                //   //     //         },
                //   //     //         child: Wrap(
                //   //     //           children: <Widget>[
                //   //     //             Icon(
                //   //     //               Icons.person,
                //   //     //               color: Colors.black38,
                //   //     //               size: 28.0,
                //   //     //             ),
                //   //     //             SizedBox(
                //   //     //               width:10,
                //   //     //             ),
                //   //     //             Text("हिंदी", style:TextStyle(fontSize:20,color: Color(0xFF204969))),
                //   //     //             SizedBox(
                //   //     //               width:95,
                //   //     //             ),
                //   //     //             // Icon(
                //   //     //             //   Icons.arrow_circle_right_sharp,
                //   //     //             //   color: Color(0xFF204969),
                //   //     //             //   size: 28.0,
                //   //     //             // ),
                //   //     //           ],
                //   //     //         ),
                //   //     //       ),
                //   //     //     ),
                //   //     //
                //   //     //     SizedBox(height: 20,),
                //   //     //     Container(
                //   //     //       height: 50,
                //   //     //       width: 220,
                //   //     //       child: ElevatedButton(
                //   //     //         onPressed:() {
                //   //     //           // Navigator.push(
                //   //     //           //   context,
                //   //     //           //   MaterialPageRoute(
                //   //     //           //       builder: (context) => SellerProfileShopDetails()),
                //   //     //           // );
                //   //     //         },
                //   //     //         child: Wrap(
                //   //     //           children: <Widget>[
                //   //     //             Icon(
                //   //     //               Icons.person,
                //   //     //               color: Colors.black38,
                //   //     //               size: 28.0,
                //   //     //             ),
                //   //     //             SizedBox(
                //   //     //               width:10,
                //   //     //             ),
                //   //     //             Text("English", style:TextStyle(fontSize:18,color: Color(0xFF204969))),
                //   //     //             SizedBox(
                //   //     //               width:73,
                //   //     //             ),
                //   //     //             // Icon(
                //   //     //             //   Icons.arrow_circle_right_sharp,
                //   //     //             //   color: Color(0xFF204969),
                //   //     //             //   size: 28.0,
                //   //     //             // ),
                //   //     //           ],
                //   //     //         ),
                //   //     //       ),
                //   //     //     ),
                //   //
                //   //
                //   //
                //   //       ],
                //   //     ),
                //
                //
                //       // buildRememberCb(),
                //
                //   ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}




