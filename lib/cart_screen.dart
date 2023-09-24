import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cartScreen extends StatelessWidget {

  var pNames = [
    "Apple Watch",
    "White Tshirt",
    "Nike Shoe",
    "Ear Headphone",
  ];

  var pSizes = [
    "36",
    "M",
    "S",
    "40",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
          color: Color(0xFF204969),),
        ),
        backgroundColor: Color(0xFF08FFC8),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          children: [
            // Align(
            //   child: Text(
            //     "My Cart",
            //     style: TextStyle(
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 20,),
            for(int i=0;i<4;i++)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.only(right: 10),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 248, 248, 248),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.only(left: 8),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Color(0xFFD4ECF7),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/${pNames[i]}.png",
                        height: 70,
                        width: 70,
                      ),
                      ),
                    Container(
                      // width: MediaQuery.of(context).size.width / 1.8,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 20, bottom: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pNames[i],
                              style: TextStyle(
                                // color: Colors.black,
                                color: Color(0xFF204969),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Size:",
                                  style: TextStyle(
                                    // color: Colors.black,
                                    color: Color(0xFF204969),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  pSizes[i],
                                  style: TextStyle(
                                    // color: Colors.black54,
                                    color: Color(0xFF204969),
                                    fontSize: 16,
                                  ),
                                ),
                                  ],
                                ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\₹100",
                          style: TextStyle(
                            // color: Colors.redAccent,
                            color: Color(0xFF204969),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.minus,color: Color(0xFF204969),),
                              Text("01",style: TextStyle(color: Color(0xFF204969),), ),
                              Icon(CupertinoIcons.plus, color: Color(0xFF204969),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20,),
            TextField(

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF204969),

                  ),
                  borderRadius: BorderRadius.circular(25),
            ),
                hintText: "Promo Code",
                hintStyle:TextStyle(color: Color(0xFFDADADA),),
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_circle_right_sharp,color: Color(0xFF204969),),
                  onPressed: (){},
                ),

                focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFF204969),

              ),
                  borderRadius: BorderRadius.circular(25),
            ),


    ),


              ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    // color: Colors.black,
                    color: Color(0xFF204969),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "\₹400",
                  style: TextStyle(
                    // color: Colors.redAccent,
                    color: Color(0xFF204969),
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2 * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.redAccent,
                  color: Color(0xFF08FFC8),
                ),
              child: Center(
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    fontSize: 20,
                    // color: Colors.white,
                    color: Color(0xFF204969),
                    fontWeight: FontWeight.w500,
                  ),
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
