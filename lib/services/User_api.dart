
import 'dart:convert';
import 'dart:core';

import '../apis/ProductModel.dart';
import '../apis/Seller.dart';
import '../apis/orderModel.dart';
import 'package:http/http.dart' as http;
import '../apis/sellerModel.dart';

class UserApi {

  static Future postSeller() async {

  }

  //get seller data
  static Future getSeller() async {
    final json = {
      "ownerName": "John Doe",
      "password": "hashed_password_here",
      "phone": "1234567890",
      "businessType": "Retail",
      "shopName": "John's Store",
      "shopOpeningTime": "10:00 AM",
      "shopClosingTime": "9:00 PM",
      "landlineNumber": "4875834759",
      "gstin": {
        "gstinNo": "GSTIN123456",
        "gstinImage": "gstin_image_url"
      },
      "fssai": {
        "licenseNumber": "FSSAI123456",
        "fssaiImage": "fssai_image_url"
      },
      "photo": "seller_photo_url",
      "address": {
        "addressOfShop": "Apt 456",
        "city": "Example City",
        "state": "Example State",
        "pincode": "12345",
        "location": "Latitude: 12.345, Longitude: 67.890"
      },
      "panCard": {
        "panNo": "ABCDE1234F",
        "panImage": "pan_card_image_url"
      },
      "bankDetails": {
        "accountNo": "1234567890",
        "ifscCode": "IFSC12345",
        "bankName": "Example Bank",
        "branchName": "Example Branch",
        "passbookImage": "bank_passbook_image_url"
      },
      "marginCharged": 10.5,
      "shopCategory": "Electronics",
      "createdAt": "2023-09-18T08:00:00Z",
      "updatedAt": "2023-09-19T09:00:00Z"
    };
    Seller seller = Seller.fromJson(json);
    return seller;
  }

  //updateSeller
  static Future updateSeller(UpdateSeller updateSeller) async {

    final apiUrl = 'https://api/seller/:sellerid/product';

    Map<String, dynamic> json = updateSeller.toJson();
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateSeller),
      );

      // if (response.statusCode == 201) {
      // } else {
      // }
    } catch (e) {
    }

  }

  // get all orders API
  static Future getOrders() async {

    // const url = "";
    // final uri = Uri.parse(url);
    // final response = await http.get(uri);
    // final body = response.body;
    // final json = jsonDecode(body);


    Map<String, dynamic> json = {
      "orderID": "101",
      "customerID": "1001",
      "sellerID": "1234",
      "productList": [
        {
          "productID": "111",
          "productName": "Product 1",
          "category": "Electronics",
          "image": ["image1.jpg", "image2.jpg"],
          "description": "Description of Product 1",
          "quantityType": "Unit",
          "mrpPrice": "49.99",
          "offerPrice": "39.99",
          "productType": "Physical",
          "returnReplacement": {
            "returnStatus": true,
            "replacementStatus": false,
            "returnPeriod": "30",
            "replacementPeriod": "0",
          },
          "sellerID": "seller123",
          "created_at": "2023-09-18T08:00:00Z",
          "updated_at": "2023-09-18T10:00:00Z",
        },
        {
          "productID": "112",
          "productName": "Product 2",
          "category": "Clothing",
          "image": ["image3.jpg", "image4.jpg"],
          "description": "Description of Product 2",
          "quantityType": "Piece",
          "mrpPrice": "29.99",
          "offerPrice": "24.99",
          "productType": "Physical",
          "returnReplacement": {
            "returnStatus": true,
            "replacementStatus": true,
            "returnPeriod": "30",
            "replacementPeriod": "30",
          },
          "sellerID": "seller456",
          "created_at": "2023-09-19T09:00:00Z",
          "updated_at": "2023-09-19T11:00:00Z",
        },
      ],
      "orderStatus": "new",
      "totalPrice": 1125.28,
      "payment": {
        "paymentID": "998",
        "paymentStatus": "paid",
        "paymentMode": "online",
        "paymentDate": "2023-09-23T15:30:00Z",
        "paymentAmount": 1125.28,
      },
    };
    Order order =  Order.fromJson(json);
    return order;
  }

  //create Product API
  static Future<void> createProduct(Product product) async {
    final apiUrl = 'https://api/seller/:sellerid/product';

    final Map<String, dynamic> productJson = {
      "productName": product.productName,
      "category": product.category,
      "image": product.image,
      "description": product.description,
      "quantityType": product.quantityType,
      "mrpPrice": product.mrpPrice,
      "offerPrice": product.offerPrice,
      "productType": product.productType,
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productJson),
      );

      // if (response.statusCode == 201) {
      // } else {
      // }
    } catch (e) {
    }
  }

  //update Product AP
  static Future<void> updateProduct(Product product) async {
    final apiUrl = 'https://api/seller/:sellerid/product';

    final Map<String, dynamic> productJson = {
      "productName": product.productName,
      "category": product.category,
      "image": product.image,
      "description": product.description,
      "quantityType": product.quantityType,
      "mrpPrice": product.mrpPrice,
      "offerPrice": product.offerPrice,
      "productType": product.productType,
    };
    var uri = Uri.parse(apiUrl);
    try {
      final response = await http.put(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productJson),
      );

      // if (response.statusCode == 201) {
      // } else {
      // }
    } catch (e) {
    }
  }

  //get products
  static Future<List<Product>> getProducts() async {
    // final uri = Uri.parse('https://api/seller/:sellerID/products');
    // final response = await http.get(uri);
    // final body = response.body;
    // final json = jsonDecode(body);

    final List<dynamic> productJson = [
      {
        "productID": "12345",
        "productName": "Example Product",
        "category": "Electronics",
        "image": ["image_url1", "image_url2"],
        "description": "This is an example product.",
        "quantityType": "Pieces",
        "mrpPrice": 499.99,
        "offerPrice": 399.99,
        "productType": "New",
        "sellerID": "9876",
        "returnReplacement": {
          "returnStatus": true,
          "replacementStatus": false,
          "returnPeriod": 30,
          "replacementPeriod": 0,
        },
      },
      {
        "productID": "12346",
        "productName": "Example Product1",
        "category": "Grocery",
        "image": ["image_url1", "image_url2"],
        "description": "This is an example product1.",
        "quantityType": "ml",
        "mrpPrice": 499.99,
        "offerPrice": 399.99,
        "productType": "New1",
        "sellerID": "9876",
        "returnReplacement": {
          "returnStatus": true,
          "replacementStatus": false,
          "returnPeriod": 30,
          "replacementPeriod": 0,
        },
      },
      {
        "productID": "12346",
        "productName": "Example Product2",
        "category": "Grocery",
        "image": ["image_url1", "image_url2"],
        "description": "This is an example product1.",
        "quantityType": "ml",
        "mrpPrice": 499.99,
        "offerPrice": 399.99,
        "productType": "New1",
        "sellerID": "9876",
        "returnReplacement": {
          "returnStatus": true,
          "replacementStatus": false,
          "returnPeriod": 30,
          "replacementPeriod": 0,
        },
      },
    ];
    List<Product> product = productJson.map((e) => Product.fromJson(e)).toList();
    return product;
  }



}