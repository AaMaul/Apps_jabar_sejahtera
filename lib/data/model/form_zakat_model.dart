/// status : true
/// message : "Transaksi berhasil dibuat."
/// data : {"nominal":10000,"payment_status":1,"user_id":null,"name":"Ikhsan","uuid":"2e59c6eb-2a1f-439d-a1e7-a8c33bd6ef90","created_at":"04-11-2022","id":1001,"snap_token":"1723414f-1c16-4271-a38a-816cbf46bb07","donation":null}

class FormZakatModel {
  FormZakatModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  FormZakatModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
FormZakatModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => FormZakatModel(  status: status ?? _status,
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
/// user_id : null
/// name : "Ikhsan"
/// uuid : "2e59c6eb-2a1f-439d-a1e7-a8c33bd6ef90"
/// created_at : "04-11-2022"
/// id : 1001
/// snap_token : "1723414f-1c16-4271-a38a-816cbf46bb07"
/// donation : null

class Data {
  Data({
      num? nominal, 
      num? paymentStatus, 
      dynamic userId, 
      String? name, 
      String? uuid, 
      String? createdAt, 
      num? id, 
      String? snapToken, 
      dynamic donation,}){
    _nominal = nominal;
    _paymentStatus = paymentStatus;
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
    _userId = json['user_id'];
    _name = json['name'];
    _uuid = json['uuid'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _snapToken = json['snap_token'];
    _donation = json['donation'];
  }
  num? _nominal;
  num? _paymentStatus;
  dynamic _userId;
  String? _name;
  String? _uuid;
  String? _createdAt;
  num? _id;
  String? _snapToken;
  dynamic _donation;
Data copyWith({  num? nominal,
  num? paymentStatus,
  dynamic userId,
  String? name,
  String? uuid,
  String? createdAt,
  num? id,
  String? snapToken,
  dynamic donation,
}) => Data(  nominal: nominal ?? _nominal,
  paymentStatus: paymentStatus ?? _paymentStatus,
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
  dynamic get userId => _userId;
  String? get name => _name;
  String? get uuid => _uuid;
  String? get createdAt => _createdAt;
  num? get id => _id;
  String? get snapToken => _snapToken;
  dynamic get donation => _donation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nominal'] = _nominal;
    map['payment_status'] = _paymentStatus;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['uuid'] = _uuid;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    map['snap_token'] = _snapToken;
    map['donation'] = _donation;
    return map;
  }

}