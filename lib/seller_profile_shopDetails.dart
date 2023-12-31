
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/registeration.dart';
import 'package:flutter_project/services/User_api.dart';
import 'package:http/http.dart' as http;
import 'apis/Seller.dart';
import 'dialog_of_registration.dart';

class SellerProfileShopDetails extends StatefulWidget {
  const SellerProfileShopDetails({super.key});
  // final String title;

  @override
  State<SellerProfileShopDetails> createState() => _SellerProfileShopDetailsState();
}

class _SellerProfileShopDetailsState extends State<SellerProfileShopDetails> {
  var shopNameController = TextEditingController();
  var GSTController = TextEditingController();
  var FSSAIController = TextEditingController();
  var LandlineController = TextEditingController();
  var shopOpenController = TextEditingController();
  var shopCloseController = TextEditingController();
  var shopAddressController = TextEditingController();

  late Seller seller;

  @override
  initState() {
    fetchSeller();
  }


  Future <void> fetchSeller() async {
    seller = await UserApi.getSeller();

    shopNameController.text = seller.shopName!;
    GSTController.text = seller.gstin!.gstinNo!;
    FSSAIController.text = seller.fssai!.licenseNumber!;
    LandlineController.text = seller.landlineNumber!;
    shopOpenController.text = seller.shopOpeningTime! as String;
    shopCloseController.text = seller.shopClosingTime! as String;
    shopAddressController.text= seller.address!.addressOfShop!;


  }

  Future<void> postShopDetails() async {


    Map<String, dynamic> json = {
      "shopName": shopNameController,
      "gstin":{
        "gstinNo": GSTController,
      },
      "fssai":{
        "licenseNumber": FSSAIController,
      },
      "landlineNumber":LandlineController,
      "shopOpeningTime":shopOpenController,
      "shopClosingTime":shopCloseController,
      "address":{
        "addressOfShop": shopAddressController,
      },



    };
    final apiUrl = 'https://api/seller/:sellerid/product';

    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(json),
      );

      if (response.statusCode == 201) {
      } else {
      }
    } catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text("Edit Shop Details"),
        ),
        body:  SingleChildScrollView(
          child: Container(
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height:20
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140,

                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/dark.jpg'),
                            ),
                            Text("GST Image")
                          ],
                        ),
                      ),
                      const SizedBox(
                          width:20
                      ),
                      Container(
                        height: 140,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/dark.jpg'),
                            ),
                            Text("FSSAI Image")
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                      height:40
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                      controller: shopNameController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "shopname length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Shop Name',
                        hintText: '  Enter shop Name',
                        prefixIcon: Icon(Icons.store),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                        controller: LandlineController,
                        decoration:  InputDecoration(
                          labelText: 'Landline Number',
                          hintText: 'Enter your Landline number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter Landline number';
                          } else if (value.length != 10) {
                            return "number must be 10 digit long";
                          }
                          return null;
                        }
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                        controller: shopAddressController,
                        decoration:  InputDecoration(
                          labelText: 'Shop Address here',
                          hintText: 'Enter your Shop Address',
                          prefixIcon: const Icon(Icons.location_on),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                        ),
                        // keyboardType: TextInputType.phone,
                        // validator: (value) {
                        //   if (value == null) {
                        //     return 'Please enter Shop Address';
                        //   } else if (value.length != 10) {
                        //     return "number must be 10 digit long";
                        //   }
                        //   return null;
                        // }
                    ),
                  ),
                  SizedBox(height:20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                      controller: GSTController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "GST Number length must be greater than 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'GST Number',
                        hintText: '  Enter GST Number',
                        prefixIcon: Icon(Icons.percent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),
                    child: TextFormField(
                      controller: FSSAIController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "FSSAI License length must be greater than 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'FSSAI License (Optional)',
                        hintText: '  Enter FSSAI License Number',
                        prefixIcon: Icon(Icons.card_membership),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),

                    child: TextFormField(
                      controller: shopOpenController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "username length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Shop Opening Time',
                        hintText: 'Enter Shop Opening Time',
                        prefixIcon: Icon(Icons.access_time),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 20
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10
                          )
                        ]
                    ),

                    child: TextFormField(
                      controller: shopCloseController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "username length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Shop Closing Time',
                        hintText: 'Enter Shop Closing Time',
                        prefixIcon: Icon(Icons.access_time),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),



                  const SizedBox(height: 22),

                  Container(
                    child: ElevatedButton(
                      child: Text('Edit Shop Time'),
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

                  SizedBox(height:40),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: postShopDetails,
                      child: Text('Save Shop Details'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}