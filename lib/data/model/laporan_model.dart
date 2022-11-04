/// status : true
/// message : "List Transactions"
/// data : [{"id":1002,"uuid":"bb700c3c-502d-4882-823b-5b0b970d8cb6","donation_id":1,"nominal":10000,"user_id":null,"name":"ikhsan heriyawan","payment_status":"1","snap_token":"d7813348-aa61-428c-90a9-61c2c75134de","created_at":"04-11-2022"},null]

class LaporanModel {
  LaporanModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LaporanModel.fromJson(dynamic json) {
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
LaporanModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => LaporanModel(  status: status ?? _status,
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

/// id : 1002
/// uuid : "bb700c3c-502d-4882-823b-5b0b970d8cb6"
/// donation_id : 1
/// nominal : 10000
/// user_id : null
/// name : "ikhsan heriyawan"
/// payment_status : "1"
/// snap_token : "d7813348-aa61-428c-90a9-61c2c75134de"
/// created_at : "04-11-2022"

class Data {
  Data({
      num? id, 
      String? uuid, 
      num? donationId, 
      num? nominal, 
      dynamic userId, 
      String? name, 
      String? paymentStatus, 
      String? snapToken, 
      String? createdAt,}){
    _id = id;
    _uuid = uuid;
    _donationId = donationId;
    _nominal = nominal;
    _userId = userId;
    _name = name;
    _paymentStatus = paymentStatus;
    _snapToken = snapToken;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _donationId = json['donation_id'];
    _nominal = json['nominal'];
    _userId = json['user_id'];
    _name = json['name'];
    _paymentStatus = json['payment_status'];
    _snapToken = json['snap_token'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _uuid;
  num? _donationId;
  num? _nominal;
  dynamic _userId;
  String? _name;
  String? _paymentStatus;
  String? _snapToken;
  String? _createdAt;
Data copyWith({  num? id,
  String? uuid,
  num? donationId,
  num? nominal,
  dynamic userId,
  String? name,
  String? paymentStatus,
  String? snapToken,
  String? createdAt,
}) => Data(  id: id ?? _id,
  uuid: uuid ?? _uuid,
  donationId: donationId ?? _donationId,
  nominal: nominal ?? _nominal,
  userId: userId ?? _userId,
  name: name ?? _name,
  paymentStatus: paymentStatus ?? _paymentStatus,
  snapToken: snapToken ?? _snapToken,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  String? get uuid => _uuid;
  num? get donationId => _donationId;
  num? get nominal => _nominal;
  dynamic get userId => _userId;
  String? get name => _name;
  String? get paymentStatus => _paymentStatus;
  String? get snapToken => _snapToken;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['donation_id'] = _donationId;
    map['nominal'] = _nominal;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['payment_status'] = _paymentStatus;
    map['snap_token'] = _snapToken;
    map['created_at'] = _createdAt;
    return map;
  }

}