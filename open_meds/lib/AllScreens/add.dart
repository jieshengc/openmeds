class AddToList {
  String? expiry;
  String? location;
  String? licenceNo;
  String? lotNo;

  AddToList({this.expiry, this.location, this.licenceNo, this.lotNo});

  AddToList.fromJson(Map<String, dynamic> json) {
    expiry = json['Expiry'];
    location = json['Location'];
    licenceNo = json['licence_no'];
    lotNo = json['lot_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Expiry'] = this.expiry;
    data['Location'] = this.location;
    data['licence_no'] = this.licenceNo;
    data['lot_no'] = this.lotNo;
    return data;
  }
}