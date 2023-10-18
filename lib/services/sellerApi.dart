import 'dart:convert';

import 'package:flutter_project/apis/sellerProfile.dart';
import 'package:http/http.dart' as http;

class SellerApi {
// TO get the seller profile information
  Future<SellerProfile> getSellerProfile(token, id) async {
    final response = await http
        .get(Uri.parse('https://api.pehchankidukan.com/seller/$id'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    Map<String, dynamic> data = jsonDecode(response.body);

    return SellerProfile.fromJson(data);
  }

  Future<SellerProfile> updateProfile(title, id, token) async {
    final response = await http.put(
      Uri.parse('https://api.pehchankidukan.com/seller/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(title),
    );

    if (response.statusCode == 200) {
      return SellerProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update profile');
    }
  }


  Future<SellerProfile> updateBankDetails(title, id, token) async {
    final response = await http.put(
      Uri.parse('https://api.pehchankidukan.com/seller/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(title),
    );

    if (response.statusCode == 200) {
      return SellerProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update profile');
    }
  }


  Future<SellerProfile> updateShopDetails(title, id, token) async {
    final response = await http.put(
      Uri.parse('https://api.pehchankidukan.com/seller/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(title),
    );

    if (response.statusCode == 200) {
      return SellerProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
