/// status : true
/// message : "Transaksi berhasil dibuat."
/// data : {"nominal":10000,"payment_status":1,"donation_id":1,"user_id":null,"name":"ikhsan heriyawan","uuid":"bb700c3c-502d-4882-823b-5b0b970d8cb6","created_at":"04-11-2022","id":1002,"snap_token":"d7813348-aa61-428c-90a9-61c2c75134de","donation":{"id":1,"title":"Ikhsan Heriyawan","description":"sdfdasf","total_budget":"100000.00","image":"img/default-banner.jpg","location":"Cirebon","category":"Disabilitas","created_at":"04-11-2022","total_collected":1220000}}

class FormDonasiModel {
  FormDonasiModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  FormDonasiModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
FormDonasiModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => FormDonasiModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// nominal : 10000
/// payment_status : 1
/// donation_id : 1
/// user_id : null
/// name : "ikhsan heriyawan"
/// uuid : "bb700c3c-502d-4882-823b-5b0b970d8cb6"
/// created_at : "04-11-2022"
/// id : 1002
/// snap_token : "d7813348-aa61-428c-90a9-61c2c75134de"
/// donation : {"id":1,"title":"Ikhsan Heriyawan","description":"sdfdasf","total_budget":"100000.00","image":"img/default-banner.jpg","location":"Cirebon","category":"Disabilitas","created_at":"04-11-2022","total_collected":1220000}

class Data {
  Data({
      num? nominal, 
      num? paymentStatus, 
      num? donationId, 
      dynamic userId, 
      String? name, 
      String? uuid, 
      String? createdAt, 
      num? id, 
      String? snapToken, 
      Donation? donation,}){
    _nominal = nominal;
    _paymentStatus = paymentStatus;
    _donationId = donationId;
    _userId = userId;
    _name = name;
    _uuid = uuid;
    _createdAt = createdAt;
    _id = id;
    _snapToken = snapToken;
    _donation = donation;
}

  Data.fromJson(dynamic json) {
    _nominal = json['nominal'];
    _paymentStatus = json['payment_status'];
    _donationId = json['donation_id'];
    _userId = json['user_id'];
    _name = json['name'];
    _uuid = json['uuid'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _snapToken = json['snap_token'];
    _donation = json['donation'] != null ? Donation.fromJson(json['donation']) : null;
  }
  num? _nominal;
  num? _paymentStatus;
  num? _donationId;
  dynamic _userId;
  String? _name;
  String? _uuid;
  String? _createdAt;
  num? _id;
  String? _snapToken;
  Donation? _donation;
Data copyWith({  num? nominal,
  num? paymentStatus,
  num? donationId,
  dynamic userId,
  String? name,
  String? uuid,
  String? createdAt,
  num? id,
  String? snapToken,
  Donation? donation,
}) => Data(  nominal: nominal ?? _nominal,
  paymentStatus: paymentStatus ?? _paymentStatus,
  donationId: donationId ?? _donationId,
  userId: userId ?? _userId,
  name: name ?? _name,
  uuid: uuid ?? _uuid,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
  snapToken: snapToken ?? _snapToken,
  donation: donation ?? _donation,
);
  num? get nominal => _nominal;
  num? get paymentStatus => _paymentStatus;
  num? get donationId => _donationId;
  dynamic get userId => _userId;
  String? get name => _name;
  String? get uuid => _uuid;
  String? get createdAt => _createdAt;
  num? get id => _id;
  String? get snapToken => _snapToken;
  Donation? get donation => _donation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nominal'] = _nominal;
    map['payment_status'] = _paymentStatus;
    map['donation_id'] = _donationId;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['uuid'] = _uuid;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['snap_token'] = _snapToken;
    if (_donation != null) {
      map['donation'] = _donation?.toJson();
    }
    return map;
  }

}

/// id : 1
/// title : "Ikhsan Heriyawan"
/// description : "sdfdasf"
/// total_budget : "100000.00"
/// image : "img/default-banner.jpg"
/// location : "Cirebon"
/// category : "Disabilitas"
/// created_at : "04-11-2022"
/// total_collected : 1220000

class Donation {
  Donation({
      num? id, 
      String? title, 
      String? description, 
      String? totalBudget, 
      String? image, 
      String? location, 
      String? category, 
      String? createdAt, 
      num? totalCollected,}){
    _id = id;
    _title = title;
    _description = description;
    _totalBudget = totalBudget;
    _image = image;
    _location = location;
    _category = category;
    _createdAt = createdAt;
    _totalCollected = totalCollected;
}

  Donation.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _totalBudget = json['total_budget'];
    _image = json['image'];
    _location = json['location'];
    _category = json['category'];
    _createdAt = json['created_at'];
    _totalCollected = json['total_collected'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _totalBudget;
  String? _image;
  String? _location;
  String? _category;
  String? _createdAt;
  num? _totalCollected;
Donation copyWith({  num? id,
  String? title,
  String? description,
  String? totalBudget,
  String? image,
  String? location,
  String? category,
  String? createdAt,
  num? totalCollected,
}) => Donation(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  totalBudget: totalBudget ?? _totalBudget,
  image: image ?? _image,
  location: location ?? _location,
  category: category ?? _category,
  createdAt: createdAt ?? _createdAt,
  totalCollected: totalCollected ?? _totalCollected,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get totalBudget => _totalBudget;
  String? get image => _image;
  String? get location => _location;
  String? get category => _category;
  String? get createdAt => _createdAt;
  num? get totalCollected => _totalCollected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['total_budget'] = _totalBudget;
    map['image'] = _image;
    map['location'] = _location;
    map['category'] = _category;
    map['created_at'] = _createdAt;
    map['total_collected'] = _totalCollected;
    return map;
  }

}