/// status : true
/// message : "Berhasil login."
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDZlODFhYmU5MzYzOTAzN2E4MDBjM2QzZDczZGMxYWJiMzJkNWJmY2RlMzNlOWIyYjE2YTg0N2JjOWQ3MDE4NzY1NzZlNDEzNjU4ODJmMzciLCJpYXQiOjE2NjY3MDM2MDkuNDUyMTU1LCJuYmYiOjE2NjY3MDM2MDkuNDUyMTYxLCJleHAiOjE2OTgyMzk2MDkuNDQ4NTIyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.OfsghsCtT606IYbMxPLKJcy8eaSla_552UhTZvM1Ro4wKtisrNHk-YMvGrtn775ATTvQfI9cVVJWB3UmXCXTUBUVW5juSyytUMoRcAOXRVTFdRAsUDyXykqLtISa-VWESHzfJ3PWLY5ozaDS6r6MA9DPyBb7iwk95kiTGRUQmZm7MLYc9ZHuhfHt08CJVPIlWAmKpoELP5JU-cxk_GpVKi9xpg85bbNnPAnAQRT8SwHscMvouoWx6smItHj7mYU4B1NRuZ4gx6uTjgCeGtp5gY88Kguwh6QuCNJWBzZQaySdKz0GgT9UoxZ6rmNy665Ry_m0ErANhi6VMpi7Epdz0p3eL2taCAqtBBwQsAd8M6Sb-ZTayfgDs9XFelMJhBsBOnQcTUK_Hwip7DqgNAKJTDWqaK-e7f-ioBKag7Ish0a2xwKPQjV4SaXNboGKtdQ5KNqmT7ZgaKXvrcpmJ3HBLrQXAjiIwdQ_JXCsE3zmaE9xR5ETlq56R73DgH-lm-9PSfypDP3ER5YdFlFsjXHMeZfvzEorYxMhOvI6XqZSN-nhYq2kQ3tFWxA76BRmLehX5WcqxACB9XnfF2ty3GKhUDmDrWmb0RE7f1fmrmLCsbV7_bKGenDGdcWdFPqMcYQgkqD0fbbWaEcQCTLMbVJDxyVDyMk8cRWFliB-IuLi-Ag","user":{"id":1,"name":"Ikhsan Heriyawan","email":"ikhsan@gmail.com","email_verified_at":null,"role":"1","created_at":"2022-10-21T07:42:47.000000Z","updated_at":"2022-10-21T07:42:47.000000Z","deleted_at":null,"tokens":[{"id":"23f8179ca4b8728edd2c4f756837e176a0870b3b140645aa1a308b2a8f7e0233c788521442606ccd","user_id":1,"client_id":1,"name":"token","scopes":[],"revoked":false,"created_at":"2022-10-25 13:11:02","updated_at":"2022-10-25 13:11:02","expires_at":"2023-10-25T13:11:02.000000Z"}]}}

class LoginModel {
  LoginModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LoginModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => LoginModel(  status: status ?? _status,
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

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDZlODFhYmU5MzYzOTAzN2E4MDBjM2QzZDczZGMxYWJiMzJkNWJmY2RlMzNlOWIyYjE2YTg0N2JjOWQ3MDE4NzY1NzZlNDEzNjU4ODJmMzciLCJpYXQiOjE2NjY3MDM2MDkuNDUyMTU1LCJuYmYiOjE2NjY3MDM2MDkuNDUyMTYxLCJleHAiOjE2OTgyMzk2MDkuNDQ4NTIyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.OfsghsCtT606IYbMxPLKJcy8eaSla_552UhTZvM1Ro4wKtisrNHk-YMvGrtn775ATTvQfI9cVVJWB3UmXCXTUBUVW5juSyytUMoRcAOXRVTFdRAsUDyXykqLtISa-VWESHzfJ3PWLY5ozaDS6r6MA9DPyBb7iwk95kiTGRUQmZm7MLYc9ZHuhfHt08CJVPIlWAmKpoELP5JU-cxk_GpVKi9xpg85bbNnPAnAQRT8SwHscMvouoWx6smItHj7mYU4B1NRuZ4gx6uTjgCeGtp5gY88Kguwh6QuCNJWBzZQaySdKz0GgT9UoxZ6rmNy665Ry_m0ErANhi6VMpi7Epdz0p3eL2taCAqtBBwQsAd8M6Sb-ZTayfgDs9XFelMJhBsBOnQcTUK_Hwip7DqgNAKJTDWqaK-e7f-ioBKag7Ish0a2xwKPQjV4SaXNboGKtdQ5KNqmT7ZgaKXvrcpmJ3HBLrQXAjiIwdQ_JXCsE3zmaE9xR5ETlq56R73DgH-lm-9PSfypDP3ER5YdFlFsjXHMeZfvzEorYxMhOvI6XqZSN-nhYq2kQ3tFWxA76BRmLehX5WcqxACB9XnfF2ty3GKhUDmDrWmb0RE7f1fmrmLCsbV7_bKGenDGdcWdFPqMcYQgkqD0fbbWaEcQCTLMbVJDxyVDyMk8cRWFliB-IuLi-Ag"
/// user : {"id":1,"name":"Ikhsan Heriyawan","email":"ikhsan@gmail.com","email_verified_at":null,"role":"1","created_at":"2022-10-21T07:42:47.000000Z","updated_at":"2022-10-21T07:42:47.000000Z","deleted_at":null,"tokens":[{"id":"23f8179ca4b8728edd2c4f756837e176a0870b3b140645aa1a308b2a8f7e0233c788521442606ccd","user_id":1,"client_id":1,"name":"token","scopes":[],"revoked":false,"created_at":"2022-10-25 13:11:02","updated_at":"2022-10-25 13:11:02","expires_at":"2023-10-25T13:11:02.000000Z"}]}

class Data {
  Data({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;
Data copyWith({  String? token,
  User? user,
}) => Data(  token: token ?? _token,
  user: user ?? _user,
);
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "Ikhsan Heriyawan"
/// email : "ikhsan@gmail.com"
/// email_verified_at : null
/// role : "1"
/// created_at : "2022-10-21T07:42:47.000000Z"
/// updated_at : "2022-10-21T07:42:47.000000Z"
/// deleted_at : null
/// tokens : [{"id":"23f8179ca4b8728edd2c4f756837e176a0870b3b140645aa1a308b2a8f7e0233c788521442606ccd","user_id":1,"client_id":1,"name":"token","scopes":[],"revoked":false,"created_at":"2022-10-25 13:11:02","updated_at":"2022-10-25 13:11:02","expires_at":"2023-10-25T13:11:02.000000Z"}]

class User {
  User({
      num? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? role, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      List<Tokens>? tokens,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _role = role;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _tokens = tokens;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _role = json['role'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    if (json['tokens'] != null) {
      _tokens = [];
      json['tokens'].forEach((v) {
        _tokens?.add(Tokens.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _role;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  List<Tokens>? _tokens;
User copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? role,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  List<Tokens>? tokens,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  role: role ?? _role,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  tokens: tokens ?? _tokens,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get role => _role;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  List<Tokens>? get tokens => _tokens;

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
    if (_tokens != null) {
      map['tokens'] = _tokens?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "23f8179ca4b8728edd2c4f756837e176a0870b3b140645aa1a308b2a8f7e0233c788521442606ccd"
/// user_id : 1
/// client_id : 1
/// name : "token"
/// scopes : []
/// revoked : false
/// created_at : "2022-10-25 13:11:02"
/// updated_at : "2022-10-25 13:11:02"
/// expires_at : "2023-10-25T13:11:02.000000Z"

class Tokens {
  Tokens({
      String? id, 
      num? userId, 
      num? clientId, 
      String? name, 
      List<dynamic>? scopes, 
      bool? revoked, 
      String? createdAt, 
      String? updatedAt, 
      String? expiresAt,}){
    _id = id;
    _userId = userId;
    _clientId = clientId;
    _name = name;
    _scopes = scopes;
    _revoked = revoked;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _expiresAt = expiresAt;
}

  Tokens.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _clientId = json['client_id'];
    _name = json['name'];
    _revoked = json['revoked'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _expiresAt = json['expires_at'];
  }
  String? _id;
  num? _userId;
  num? _clientId;
  String? _name;
  List<dynamic>? _scopes;
  bool? _revoked;
  String? _createdAt;
  String? _updatedAt;
  String? _expiresAt;
Tokens copyWith({  String? id,
  num? userId,
  num? clientId,
  String? name,
  List<dynamic>? scopes,
  bool? revoked,
  String? createdAt,
  String? updatedAt,
  String? expiresAt,
}) => Tokens(  id: id ?? _id,
  userId: userId ?? _userId,
  clientId: clientId ?? _clientId,
  name: name ?? _name,
  scopes: scopes ?? _scopes,
  revoked: revoked ?? _revoked,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  expiresAt: expiresAt ?? _expiresAt,
);
  String? get id => _id;
  num? get userId => _userId;
  num? get clientId => _clientId;
  String? get name => _name;
  List<dynamic>? get scopes => _scopes;
  bool? get revoked => _revoked;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get expiresAt => _expiresAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['client_id'] = _clientId;
    map['name'] = _name;
    if (_scopes != null) {
      map['scopes'] = _scopes?.map((v) => v.toJson()).toList();
    }
    map['revoked'] = _revoked;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['expires_at'] = _expiresAt;
    return map;
  }

}