/// status : true
/// message : "Update Successfully"

class Updateapi {
  Updateapi({
      bool? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  Updateapi.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  bool? _status;
  String? _message;
Updateapi copyWith({  bool? status,
  String? message,
}) => Updateapi(  status: status ?? _status,
  message: message ?? _message,
);
  bool? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}