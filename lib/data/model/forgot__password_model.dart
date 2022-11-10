/// status : true
/// message : "Berhasil Mengupdate Password"
/// data : []

class ForgotPasswordModel {
  ForgotPasswordModel({
      bool? status, 
      String? message, 
      List<dynamic>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ForgotPasswordModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
  List<dynamic>? _data;
ForgotPasswordModel copyWith({  bool? status,
  String? message,
  List<dynamic>? data,
}) => ForgotPasswordModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<dynamic>? get data => _data;

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