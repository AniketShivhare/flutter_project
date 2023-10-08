class Seller {
  String? ownerName;
  String? password;
  String? phone;
  String? businessType;
  String? shopName;
  String? landlineNumber;
  GSTIN? gstin;
  FSSAI? fssai;
  String? photo;
  Address? address;
  DateTime? shopOpeningTime;
  DateTime? shopClosingTime;

  PanCard? panCard;
  BankDetails? bankDetails;
  double? marginCharged;
  String? shopCategory;
  DateTime? createdAt;
  DateTime? updatedAt;

  Seller({
    this.ownerName,
    this.password,
    this.phone,
    this.businessType,
    this.shopName,
    this.landlineNumber,
    this.gstin,
    this.fssai,
    this.photo,
    this.address,
    this.shopOpeningTime,
    this.shopClosingTime,
    this.panCard,
    this.bankDetails,
    this.marginCharged,
    this.shopCategory,
    this.createdAt,
    this.updatedAt,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      ownerName: json['ownerName'],
      password: json['password'],
      phone: json['phone'],
      businessType: json['businessType'],
      shopName: json['shopName'],
      landlineNumber: json['landlineNumber'],
      gstin: GSTIN.fromJson(json['gstin']),
      fssai: FSSAI.fromJson(json['fssai']),
      photo: json['photo'],
      address: Address.fromJson(json['address']),
      shopOpeningTime: DateTime.parse(json['shopOpeningTime']),
      shopClosingTime: DateTime.parse(json['shopClosingTime']),
      panCard: PanCard.fromJson(json['panCard']),
      bankDetails: BankDetails.fromJson(json['bankDetails']),
      marginCharged: json['marginCharged'].toDouble(),
      shopCategory: json['shopCategory'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class FSSAI {
  String? licenseNumber;
  String? fssaiImage;
  FSSAI({
    this.licenseNumber,
    this.fssaiImage,
  });
  factory FSSAI.fromJson(Map<String, dynamic> json) {
    return FSSAI(
      licenseNumber: json['licenseNumber'],
      fssaiImage: json['fssaiImage'],
    );
  }
}

class GSTIN {
  String? gstinNo;
  String? gstinImage;

  GSTIN({
    this.gstinNo,
    this.gstinImage,
  });

  factory GSTIN.fromJson(Map<String, dynamic> json) {
    return GSTIN(
      gstinNo: json['gstinNo'],
      gstinImage: json['gstinImage'],
    );
  }
}

class Address {
  String? addressOfShop;
  String? city;
  String? state;
  String? pincode;
  String? location;

  Address({
    this.addressOfShop,
    this.city,
    this.state,
    this.pincode,
    this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressOfShop: json['addressOfShop'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      location: json['location'],
    );
  }
}

class PanCard {
  String? panNo;
  String? panImage;

  PanCard({
    this.panNo,
    this.panImage,
  });

  factory PanCard.fromJson(Map<String, dynamic> json) {
    return PanCard(
      panNo: json['panNo'],
      panImage: json['panImage'],
    );
  }
}

class BankDetails {
  String? accountNo;
  String? ifscCode;
  String? bankName;
  String? branchName;
  String? passbookImage;

  BankDetails({
    this.accountNo,
    this.ifscCode,
    this.bankName,
    this.branchName,
    this.passbookImage,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return BankDetails(
      accountNo: json['accountNo'],
      ifscCode: json['ifscCode'],
      bankName: json['bankName'],
      branchName: json['branchName'],
      passbookImage: json['passbookImage'],
    );
  }
}