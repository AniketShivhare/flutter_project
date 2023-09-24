class Product {
  String productID;
  String productName;
  String category;
  List<String> image;
  String description;
  String quantityType;
  double mrpPrice;
  double offerPrice;
  String productType;
  ReturnReplacement returnReplacement;
  String sellerID;

  Product({
    required this.productID,
    required this.productName,
    required this.category,
    required this.image,
    required this.description,
    required this.quantityType,
    required this.mrpPrice,
    required this.offerPrice,
    required this.productType,
    required this.returnReplacement,
    required this.sellerID,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productID: json['productID'] ?? '',
      productName: json['productName'] ?? '',
      category: json['category'] ?? '',
      image: List<String>.from(json['image']) ?? [],
      description: json['description'] ?? '',
      quantityType: json['quantityType'] ?? '',
      mrpPrice: json['mrpPrice'].toDouble() ?? 0,
      offerPrice: json['offerPrice'].toDouble() ?? 0,
      productType: json['productType'] ?? '',
      returnReplacement: ReturnReplacement.fromJson(json['returnReplacement']),
      sellerID: json['sellerID'] ?? '',
    );
  }
}


class ReturnReplacement {
  bool returnStatus;
  bool replacementStatus;
  int returnPeriod;
  int replacementPeriod;

  ReturnReplacement({
    required this.returnStatus,
    required this.replacementStatus,
    required this.returnPeriod,
    required this.replacementPeriod,
  });

  factory ReturnReplacement.fromJson(Map<String, dynamic> json) {
    print(json);
    if(json==null) {
      return ReturnReplacement(
        returnStatus: false,
        replacementStatus: false,
        returnPeriod: 0,
        replacementPeriod: 0,
      );
    }
    return ReturnReplacement(
      returnStatus: json['returnStatus'] ?? false,
      replacementStatus: json['replacementStatus'] ?? false,
      returnPeriod: json['returnPeriod'] ?? 0,
      replacementPeriod: json['replacementPeriod'] ?? 0,
    );
  }
}