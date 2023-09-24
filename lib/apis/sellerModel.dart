class UpdateSeller {
  String ownerName;
  String phone;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String pincode;
  String location;
  String shopTimings;
  String panNo;
  String panImage;
  String accountNo;
  String ifscCode;
  String bankName;
  String branchName;
  String passbookImage;
  String marginCharged;
  String shopCategory;

  UpdateSeller({
    this.ownerName = '',
    this.phone = '',
    this.addressLine1 = '',
    this.addressLine2 = '',
    this.city = '',
    this.state = '',
    this.pincode = '',
    this.location = '',
    this.shopTimings = '',
    this.panNo = '',
    this.panImage = '',
    this.accountNo = '',
    this.ifscCode = '',
    this.bankName = '',
    this.branchName = '',
    this.passbookImage = '',
    this.marginCharged = '',
    this.shopCategory = '',
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      "ownerName": ownerName,
      "phone": phone,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "city": city,
      "state": state,
      "pincode": pincode,
      "location": location,
      "shopTimings": shopTimings,
      "panNo": panNo,
      "panImage": panImage,
      "accountNo": accountNo,
      "ifscCode": ifscCode,
      "bankName": bankName,
      "branchName": branchName,
      "passbookImage": passbookImage,
      "marginCharged": marginCharged,
      "shopCategory": shopCategory,
    };

    // Excluding empty fields
    json.removeWhere((key, value) => value == '');

    return json;
  }
}