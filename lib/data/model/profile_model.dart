/// status : true
/// message : "Users"
/// data : {"id":1,"name":"Ari Maulana Agustina","email":"maul@gmail.com","email_verified_at":null,"role":"1","created_at":"2022-11-03T13:57:20.000000Z","updated_at":"2022-11-04T01:09:47.000000Z","deleted_at":null,"user_detail":{"id":1,"phone_number":"08212837232","security_question":"toket","image":"http://localhost:8000/storage/img/default.jpg","created_at":"2022-11-03T13:57:20.000000Z","updated_at":"2022-11-04T01:09:47.000000Z"}}

class ProfileModel {
  ProfileModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ProfileModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
ProfileModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => ProfileModel(  status: status ?? _status,
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

/// id : 1
/// name : "Ari Maulana Agustina"
/// email : "maul@gmail.com"
/// email_verified_at : null
/// role : "1"
/// created_at : "2022-11-03T13:57:20.000000Z"
/// updated_at : "2022-11-04T01:09:47.000000Z"
/// deleted_at : null
/// user_detail : {"id":1,"phone_number":"08212837232","security_question":"toket","image":"http://localhost:8000/storage/img/default.jpg","created_at":"2022-11-03T13:57:20.000000Z","updated_at":"2022-11-04T01:09:47.000000Z"}

class Data {
  Data({
      num? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? role, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      UserDetail? userDetail,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _userDetail = userDetail;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _role = json['role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _userDetail = json['user_detail'] != null ? UserDetail.fromJson(json['user_detail']) : null;
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  UserDetail? _userDetail;
Data copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? role,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  UserDetail? userDetail,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  role: role ?? _role,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  userDetail: userDetail ?? _userDetail,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  UserDetail? get userDetail => _userDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['role'] = _role;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    if (_userDetail != null) {
      map['user_detail'] = _userDetail?.toJson();
    }
    return map;
  }

}

/// id : 1
/// phone_number : "08212837232"
/// security_question : "toket"
/// image : "http://localhost:8000/storage/img/default.jpg"
/// created_at : "2022-11-03T13:57:20.000000Z"
/// updated_at : "2022-11-04T01:09:47.000000Z"

class UserDetail {
  UserDetail({
      num? id, 
      String? phoneNumber, 
      String? securityQuestion, 
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _phoneNumber = phoneNumber;
    _securityQuestion = securityQuestion;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  UserDetail.fromJson(dynamic json) {
    _id = json['id'];
    _phoneNumber = json['phone_number'];
    _securityQuestion = json['security_question'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _phoneNumber;
  String? _securityQuestion;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
UserDetail copyWith({  num? id,
  String? phoneNumber,
  String? securityQuestion,
  String? image,
  String? createdAt,
  String? updatedAt,
}) => UserDetail(  id: id ?? _id,
  phoneNumber: phoneNumber ?? _phoneNumber,
  securityQuestion: securityQuestion ?? _securityQuestion,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get phoneNumber => _phoneNumber;
  String? get securityQuestion => _securityQuestion;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['phone_number'] = _phoneNumber;
    map['security_question'] = _securityQuestion;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}