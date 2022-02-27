class Details {
  String? licenceNo;
  String? productName;
  String? licenseHolder;
  String? approvalDate;
  String? forensicClassification;
  String? atcCode;
  String? dosageForm;
  String? routeOfAdministration;
  String? manufacturer;
  String? countryOfManufacturer;
  String? activeIngredients;
  String? strength;
  String? expiryDate;

  Details(
      {this.licenceNo,
      this.productName,
      this.licenseHolder,
      this.approvalDate,
      this.forensicClassification,
      this.atcCode,
      this.dosageForm,
      this.routeOfAdministration,
      this.manufacturer,
      this.countryOfManufacturer,
      this.activeIngredients,
      this.strength,
      this.expiryDate});

  Details.fromJson(Map<String, dynamic> json) {
    licenceNo = json['licence_no'];
    productName = json['product_name'];
    licenseHolder = json['license_holder'];
    approvalDate = json['approval_date'];
    forensicClassification = json['forensic_classification'];
    atcCode = json['atc_code'];
    dosageForm = json['dosage_form'];
    routeOfAdministration = json['route_of_administration'];
    manufacturer = json['manufacturer'];
    countryOfManufacturer = json['country_of_manufacturer'];
    activeIngredients = json['active_ingredients'];
    strength = json['strength'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['licence_no'] = this.licenceNo;
    data['product_name'] = this.productName;
    data['license_holder'] = this.licenseHolder;
    data['approval_date'] = this.approvalDate;
    data['forensic_classification'] = this.forensicClassification;
    data['atc_code'] = this.atcCode;
    data['dosage_form'] = this.dosageForm;
    data['route_of_administration'] = this.routeOfAdministration;
    data['manufacturer'] = this.manufacturer;
    data['country_of_manufacturer'] = this.countryOfManufacturer;
    data['active_ingredients'] = this.activeIngredients;
    data['strength'] = this.strength;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}