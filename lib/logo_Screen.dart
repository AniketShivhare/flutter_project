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


                ),
            ],
          ),
        ),
      ),
    );
  }
}




