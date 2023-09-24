import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}



class _LanguageScreenState extends State<LanguageScreen> {
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
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x665ac18e),
                          Color(0x995ac18e),
                          Color(0xcc5ac18e),
                          Color(0xff5ac18e),
                          // Color(0x6608FFC8),
                          // Color(0x9908FFC8),
                          // Color(0xcc08FFC8),
                          // Color(0xff08FFC8),
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 150,),
                      Text(
                        'Choose Language',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // SizedBox(height: 50,),
                      // buildEmail(),
                      // SizedBox(height: 20,),
                      // buildPassword(),
                      // buildForgotPassBtn(),


                      // Padding(
                      //   padding: const EdgeInsets.only(left: 38.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Container(
                              height: 50,
                              width: 220,
                              child: ElevatedButton(
                                onPressed:() {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => MyHomePage()),
                                  // );
                                },
                                child: Wrap(
                                  children: <Widget>[
                                    // Icon(
                                    //   Icons.person,
                                    //   color: Colors.black38,
                                    //   size: 28.0,
                                    // ),
                                    SizedBox(
                                      width:63,
                                    ),
                                    Text("हिंदी", style:TextStyle(fontSize:20,color: Color(0xFF204969))),
                                    SizedBox(
                                      width:75,
                                    ),
                                    // Icon(
                                    //   Icons.arrow_circle_right_sharp,
                                    //   color: Color(0xFF204969),
                                    //   size: 28.0,
                                    // ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 15,),
                            Container(
                              height: 50,
                              width: 220,
                              child: ElevatedButton(
                                onPressed:() {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => SellerProfileShopDetails()),
                                  // );
                                },
                                child: Wrap(
                                  children: <Widget>[
                                    // Icon(
                                    //   Icons.person,
                                    //   color: Colors.black38,
                                    //   size: 28.0,
                                    // ),
                                    SizedBox(
                                      width:50,
                                    ),
                                    Text("English", style:TextStyle(fontSize:18,color: Color(0xFF204969))),
                                    SizedBox(
                                      width:63,
                                    ),
                                    // Icon(
                                    //   Icons.arrow_circle_right_sharp,
                                    //   color: Color(0xFF204969),
                                    //   size: 28.0,
                                    // ),
                                  ],
                                ),
                              ),
                            ),



                          ],
                        ),


                      // buildRememberCb(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




