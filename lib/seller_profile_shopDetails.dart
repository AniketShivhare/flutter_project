import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/apis/sellerProfile.dart';
import 'package:flutter_project/registeration.dart';
import 'package:flutter_project/services/User_api.dart';
import 'package:flutter_project/services/sellerApi.dart';
import 'package:flutter_project/services/sellerTokenId.dart';
import 'package:http/http.dart' as http;
import 'apis/Seller.dart';
import 'dialog_of_registration.dart';

class SellerProfileShopDetails extends StatefulWidget {
  const SellerProfileShopDetails({super.key});
  // final String title;

  @override
  State<SellerProfileShopDetails> createState() =>
      _SellerProfileShopDetailsState();
}

class _SellerProfileShopDetailsState extends State<SellerProfileShopDetails> {
  var shopNameController = TextEditingController();
  var GSTController = TextEditingController();
  var FSSAIController = TextEditingController();
  var LandlineController = TextEditingController();
  var shopOpenController = TextEditingController();
  var shopCloseController = TextEditingController();
  var shopAddressController = TextEditingController();
  String GstImage = "";

  String sellerId = Candidate().id;
  String sellerToken = Candidate().token;
  late SellerProfile seller;

  @override
  initState() {
    fetchSeller();
  }

  Future<void> fetchSeller() async {
    seller = await SellerApi().getSellerProfile(sellerToken, sellerId);

    shopNameController.text = seller.data.shopName;
    GSTController.text = seller.data.gstin.gstinNo;
    // GstImage = seller.data.gstin.gstinImage;
    shopAddressController.text = seller.data.address.addressLine1;
    LandlineController.text = seller.data.phone;
    // FSSAIController.text = seller.data.;
    // LandlineController.text = seller.data.;
    // shopOpenController.text = seller.data.shopTimings.;
    print(shopOpenController.text);
    // shopCloseController.text = seller.data.shopTimings as String;
  }

  Future<void> postShopDetails() async {
    Map<String, dynamic> json = {
      "shopName": shopNameController.text,
      "gstinNo": GSTController.text,
      // "licenseNumber": FSSAIController,
      "phone": LandlineController.text,
      // "shopOpeningTime": shopOpenController,
      // "shopClosingTime": shopCloseController,
      "addressLine1": shopAddressController.text,
    };
    final response =
        await SellerApi().updateBankDetails(json, sellerId, sellerToken);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Shop Details Updated")));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Edit Shop Details"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/dark.jpg'),
                            ),
                            Text("GST Image")
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        height: 140,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/dark.jpg'),
                            ),
                            Text("FSSAI Image")
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: shopNameController,
                      validator: (value) {
                        if (value!.length < 5) {
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
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                        controller: LandlineController,
                        decoration: InputDecoration(
                          labelText: 'Landline Number',
                          hintText: 'Enter your Landline number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter Landline number';
                          } else if (value.length != 10) {
                            return "number must be 10 digit long";
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: shopAddressController,
                      decoration: InputDecoration(
                        labelText: 'Shop Address here',
                        hintText: 'Enter your Shop Address',
                        prefixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0)),
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
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: GSTController,
                      validator: (value) {
                        if (value!.length < 5) {
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
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: FSSAIController,
                      validator: (value) {
                        if (value!.length < 5) {
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
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: shopOpenController,
                      validator: (value) {
                        if (value!.length < 5) {
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
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 5),
                              color: Colors.deepOrange.withOpacity(.2),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ]),
                    child: TextFormField(
                      controller: shopCloseController,
                      validator: (value) {
                        if (value!.length < 5) {
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return SimpleCustomAlert();
                            });
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade300)),
                    ),
                  ),
                  SizedBox(height: 40),
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
        ));
  }
}
