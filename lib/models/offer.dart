class Offer {
  String? offerCode;
  String? outletCode;
  String? programCode;
  String? programNameEn;
  String? nameEn;
  String? offerType;
  String? offerLink;
  String? scrapeLink;
  String? createdAt;
  String? outletNameEn;
  String? description;
  String? categoryExrefNr;
  String? backgroundImage;
  String? logo;
  String? addressCode;
  double? lat;
  double? lng;
  String? textAddress;
  String? cityCode;
  String? cityNameEn;

  Offer(
      {this.offerCode,
      this.outletCode,
      this.programCode,
      this.programNameEn,
      this.nameEn,
      this.offerType,
      this.offerLink,
      this.scrapeLink,
      this.createdAt,
      this.outletNameEn,
      this.description,
      this.categoryExrefNr,
      this.backgroundImage,
      this.logo,
      this.addressCode,
      this.lat,
      this.lng,
      this.textAddress,
      this.cityCode,
      this.cityNameEn});

  Offer.fromJson(Map<String, dynamic> json) {
    offerCode = json['offer_code'];
    outletCode = json['outlet_code'];
    programCode = json['program_code'];
    programNameEn = json['program_name_en'];
    nameEn = json['name_en'];
    offerType = json['offer_type'];
    offerLink = json['offer_link'];
    scrapeLink = json['scrape_link'];
    createdAt = json['created_at'];
    outletNameEn = json['outlet_name_en'];
    description = json['description'];
    categoryExrefNr = json['category_exref_nr'];
    backgroundImage = json['background_image'];
    logo = json['logo'];
    addressCode = json['address_code'];
    lat = json['lat'];
    lng = json['lng'];
    textAddress = json['text_address'];
    cityCode = json['city_code'];
    cityNameEn = json['city_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offer_code'] = offerCode;
    data['outlet_code'] = outletCode;
    data['program_code'] = programCode;
    data['program_name_en'] = programNameEn;
    data['name_en'] = nameEn;
    data['offer_type'] = offerType;
    data['offer_link'] = offerLink;
    data['scrape_link'] = scrapeLink;
    data['created_at'] = createdAt;
    data['outlet_name_en'] = outletNameEn;
    data['description'] = description;
    data['category_exref_nr'] = categoryExrefNr;
    data['background_image'] = backgroundImage;
    data['logo'] = logo;
    data['address_code'] = addressCode;
    data['lat'] = lat;
    data['lng'] = lng;
    data['text_address'] = textAddress;
    data['city_code'] = cityCode;
    data['city_name_en'] = cityNameEn;
    return data;
  }
}
