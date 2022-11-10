/// status : true
/// message : "List Pemasukan Zakat"
/// data : [{"id":1001,"uuid":"0600238b-6317-428c-b635-58ec63f67832","donation_id":null,"nominal":30000,"user_id":null,"name":"Mustafa Mraz","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1002,"uuid":"904f7b67-1854-41cc-99f6-9b1e9bf76e45","donation_id":null,"nominal":100000,"user_id":null,"name":"Mrs. Brenda Marks I","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1003,"uuid":"94b889de-5384-4490-80b5-204c6a9516d2","donation_id":null,"nominal":100000,"user_id":null,"name":"Jarrell Hand","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1004,"uuid":"5b0674d5-aa1f-44e6-ad55-f615ef9cca00","donation_id":null,"nominal":10000,"user_id":null,"name":"Miss Clotilde Schuster","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1005,"uuid":"213acb3d-47ad-4e2d-8adc-a47e9550435a","donation_id":null,"nominal":20000,"user_id":null,"name":"Heath Stark","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1006,"uuid":"a8dd9f49-e26e-4b84-b98e-04ebb1189500","donation_id":null,"nominal":50000,"user_id":null,"name":"Verna Lehner","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1007,"uuid":"06510a30-2f9f-4454-983b-2f6178c48611","donation_id":null,"nominal":50000,"user_id":null,"name":"Lucas Rice","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1008,"uuid":"96e59db8-7c25-43a3-aa65-d0e83c15bde2","donation_id":null,"nominal":10000,"user_id":null,"name":"Mr. Maximillian Dietrich","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1009,"uuid":"edec24f8-1651-45e8-a79b-49a005a0733e","donation_id":null,"nominal":100000,"user_id":null,"name":"Narciso O'Kon","payment_status":"2","snap_token":null,"created_at":"01-11-2022"},{"id":1010,"uuid":"e917ad65-d997-428d-9cd7-aab088d85d73","donation_id":null,"nominal":30000,"user_id":null,"name":"Ms. Ludie Rosenbaum","payment_status":"2","snap_token":null,"created_at":"01-11-2022"}]

class PemasukanZakatModel {
  PemasukanZakatModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  PemasukanZakatModel.fromJson(dynamic json) {
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
PemasukanZakatModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => PemasukanZakatModel(  status: status ?? _status,
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

/// id : 1001
/// uuid : "0600238b-6317-428c-b635-58ec63f67832"
/// donation_id : null
/// nominal : 30000
/// user_id : null
/// name : "Mustafa Mraz"
/// payment_status : "2"
/// snap_token : null
/// created_at : "01-11-2022"

class Data {
  Data({
      num? id, 
      String? uuid, 
      dynamic donationId, 
      num? nominal, 
      dynamic userId, 
      String? name, 
      String? paymentStatus, 
      dynamic snapToken, 
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
  dynamic _donationId;
  num? _nominal;
  dynamic _userId;
  String? _name;
  String? _paymentStatus;
  dynamic _snapToken;
  String? _createdAt;
Data copyWith({  num? id,
  String? uuid,
  dynamic donationId,
  num? nominal,
  dynamic userId,
  String? name,
  String? paymentStatus,
  dynamic snapToken,
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
  dynamic get donationId => _donationId;
  num? get nominal => _nominal;
  dynamic get userId => _userId;
  String? get name => _name;
  String? get paymentStatus => _paymentStatus;
  dynamic get snapToken => _snapToken;
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