/// status : true
/// message : "List Pengeluaran Donasi"
/// data : [{"id":1,"name":"Miguel McGlynn DDS","date":"2022-11-07","nominal":100000,"description":"Dolor dolorum rerum provident veritatis id sint.","donation_id":1,"created_at":"2022-11-07T08:59:24.000000Z","updated_at":"2022-11-07T08:59:24.000000Z","donation":{"id":1,"name":"Miguel McGlynn DDS","date":"2022-11-07","nominal":100000,"description":"Dolor dolorum rerum provident veritatis id sint.","donation_id":1,"created_at":"2022-11-07T08:59:24.000000Z","updated_at":"2022-11-07T08:59:24.000000Z"}},null]

class PengeluaranModel {
  PengeluaranModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PengeluaranModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
PengeluaranModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => PengeluaranModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Miguel McGlynn DDS"
/// date : "2022-11-07"
/// nominal : 100000
/// description : "Dolor dolorum rerum provident veritatis id sint."
/// donation_id : 1
/// created_at : "2022-11-07T08:59:24.000000Z"
/// updated_at : "2022-11-07T08:59:24.000000Z"
/// donation : {"id":1,"name":"Miguel McGlynn DDS","date":"2022-11-07","nominal":100000,"description":"Dolor dolorum rerum provident veritatis id sint.","donation_id":1,"created_at":"2022-11-07T08:59:24.000000Z","updated_at":"2022-11-07T08:59:24.000000Z"}

class Data {
  Data({
      num? id, 
      String? name, 
      String? date, 
      num? nominal, 
      String? description, 
      num? donationId, 
      String? createdAt, 
      String? updatedAt, 
      Donation? donation,}){
    _id = id;
    _name = name;
    _date = date;
    _nominal = nominal;
    _description = description;
    _donationId = donationId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _donation = donation;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _date = json['date'];
    _nominal = json['nominal'];
    _description = json['description'];
    _donationId = json['donation_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _donation = json['donation'] != null ? Donation.fromJson(json['donation']) : null;
  }
  num? _id;
  String? _name;
  String? _date;
  num? _nominal;
  String? _description;
  num? _donationId;
  String? _createdAt;
  String? _updatedAt;
  Donation? _donation;
Data copyWith({  num? id,
  String? name,
  String? date,
  num? nominal,
  String? description,
  num? donationId,
  String? createdAt,
  String? updatedAt,
  Donation? donation,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  date: date ?? _date,
  nominal: nominal ?? _nominal,
  description: description ?? _description,
  donationId: donationId ?? _donationId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  donation: donation ?? _donation,
);
  num? get id => _id;
  String? get name => _name;
  String? get date => _date;
  num? get nominal => _nominal;
  String? get description => _description;
  num? get donationId => _donationId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Donation? get donation => _donation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['date'] = _date;
    map['nominal'] = _nominal;
    map['description'] = _description;
    map['donation_id'] = _donationId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_donation != null) {
      map['donation'] = _donation?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Miguel McGlynn DDS"
/// date : "2022-11-07"
/// nominal : 100000
/// description : "Dolor dolorum rerum provident veritatis id sint."
/// donation_id : 1
/// created_at : "2022-11-07T08:59:24.000000Z"
/// updated_at : "2022-11-07T08:59:24.000000Z"

class Donation {
  Donation({
      num? id, 
      String? name, 
      String? date, 
      num? nominal, 
      String? description, 
      num? donationId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _date = date;
    _nominal = nominal;
    _description = description;
    _donationId = donationId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Donation.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _date = json['date'];
    _nominal = json['nominal'];
    _description = json['description'];
    _donationId = json['donation_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _date;
  num? _nominal;
  String? _description;
  num? _donationId;
  String? _createdAt;
  String? _updatedAt;
Donation copyWith({  num? id,
  String? name,
  String? date,
  num? nominal,
  String? description,
  num? donationId,
  String? createdAt,
  String? updatedAt,
}) => Donation(  id: id ?? _id,
  name: name ?? _name,
  date: date ?? _date,
  nominal: nominal ?? _nominal,
  description: description ?? _description,
  donationId: donationId ?? _donationId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  String? get date => _date;
  num? get nominal => _nominal;
  String? get description => _description;
  num? get donationId => _donationId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['date'] = _date;
    map['nominal'] = _nominal;
    map['description'] = _description;
    map['donation_id'] = _donationId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}