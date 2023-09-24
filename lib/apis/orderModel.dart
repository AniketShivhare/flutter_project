import 'productModel.dart';

class Payment {
  String paymentID;
  String paymentMode;
  String paymentStatus;
  DateTime paymentDate;
  double paymentAmount;

  Payment({
    required this.paymentID,
    required this.paymentMode,
    required this.paymentStatus,
    required this.paymentDate,
    required this.paymentAmount,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentID: json['paymentID'],
      paymentMode: json['paymentMode'],
      paymentStatus: json['paymentStatus'],
      paymentDate: DateTime.parse(json['paymentDate']),
      paymentAmount: json['paymentAmount'].toDouble(),
    );
  }
}



class Order {
  String orderID;
  String customerID;
  String sellerID;
  List<Product> productList;
  String orderStatus;
  double totalPrice;
  Payment payment;

  Order({
    required this.orderID,
    required this.customerID,
    required this.sellerID,
    required this.productList,
    required this.orderStatus,
    required this.totalPrice,
    required this.payment,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['orderID'] ?? '',
      customerID: json['customerID'] ?? '',
      sellerID: json['sellerID'] ?? '',
      productList: (json['productList'] as List<dynamic>)
          .map((productJson) => Product.fromJson(productJson as Map<String, dynamic>))
          .toList() ?? [],
      orderStatus: json['orderStatus'] ?? '',
      totalPrice: json['totalPrice'].toDouble() ?? 0,
      payment: Payment.fromJson(json['payment']),
    );
  }
}