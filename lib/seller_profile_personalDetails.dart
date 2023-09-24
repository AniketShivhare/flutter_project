
import 'package:flutter/material.dart';
import 'package:flutter_project/services/User_api.dart';

import 'apis/Seller.dart';

class SellerProfilePersonalDetails extends StatefulWidget {
  const SellerProfilePersonalDetails({super.key});
  // final String title;

  @override
  State<SellerProfilePersonalDetails> createState() => _SellerProfilePersonalDetailsState();
}

class _SellerProfilePersonalDetailsState extends State<SellerProfilePersonalDetails> {



  late Seller seller;

  @override
  initState() {
    fetchSeller();
  }

  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  Future <void> fetchSeller() async {
    seller = await UserApi.getSeller();
  nameController.text = seller.ownerName!;
  phoneController.text = seller.phone!;

  }
  Future<void> postPersonalDetails() async {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text("Edit profile page"),
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
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/dark.jpg'),
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
                      controller: nameController,
                      validator: (value) {
                        if(value!.length<5) {
                          return "username length must be 5";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'username',
                        hintText: '  enter username',
                        prefixIcon: Icon(Icons.person),
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
                        controller: phoneController,
                        decoration:  InputDecoration(
                          labelText: 'Mobile Number',
                          hintText: 'Enter your mobile number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a mobile number';
                          } else if (value.length != 10) {
                            return "number must be 10 digit long";
                          }
                          return null;
                        }
                    ),
                  ),

                  SizedBox(height:40),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: postPersonalDetails,
                      child: Text('Save Profile'),
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