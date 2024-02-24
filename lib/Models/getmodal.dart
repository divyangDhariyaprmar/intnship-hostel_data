

class Getmodal {
  Getmodal({
      bool? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  Getmodal.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Response>? _response;
Getmodal copyWith({  bool? status,
  String? message,
  List<Response>? response,
}) => Getmodal(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  bool? get status => _status;
  String? get message => _message;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// registration_main_id : "164"
/// user_code : "Student46"
/// first_name : "MeetT"
/// middle_name : "abcd"
/// last_name : "djs"
/// phone_number : "1234567890"
/// phone_country_code : "+9"
/// email : "abcd@gmail.com"
/// created_time : "2023-03-25 06:20:49"

class Response {
  Response({
      String? registrationMainId, 
      String? userCode, 
      String? firstName, 
      String? middleName, 
      String? lastName, 
      String? phoneNumber, 
      String? phoneCountryCode, 
      String? email, 
      String? createdTime,}){
    _registrationMainId = registrationMainId;
    _userCode = userCode;
    _firstName = firstName;
    _middleName = middleName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _phoneCountryCode = phoneCountryCode;
    _email = email;
    _createdTime = createdTime;
}

  Response.fromJson(dynamic json) {
    _registrationMainId = json['registration_main_id'];
    _userCode = json['user_code'];
    _firstName = json['first_name'];
    _middleName = json['middle_name'];
    _lastName = json['last_name'];
    _phoneNumber = json['phone_number'];
    _phoneCountryCode = json['phone_country_code'];
    _email = json['email'];
    _createdTime = json['created_time'];
  }
  String? _registrationMainId;
  String? _userCode;
  String? _firstName;
  String? _middleName;
  String? _lastName;
  String? _phoneNumber;
  String? _phoneCountryCode;
  String? _email;
  String? _createdTime;

  get response => null;
Response copyWith({  String? registrationMainId,
  String? userCode,
  String? firstName,
  String? middleName,
  String? lastName,
  String? phoneNumber,
  String? phoneCountryCode,
  String? email,
  String? createdTime,
}) => Response(  registrationMainId: registrationMainId ?? _registrationMainId,
  userCode: userCode ?? _userCode,
  firstName: firstName ?? _firstName,
  middleName: middleName ?? _middleName,
  lastName: lastName ?? _lastName,
  phoneNumber: phoneNumber ?? _phoneNumber,
  phoneCountryCode: phoneCountryCode ?? _phoneCountryCode,
  email: email ?? _email,
  createdTime: createdTime ?? _createdTime,
);
  String? get registrationMainId => _registrationMainId;
  String? get userCode => _userCode;
  String? get firstName => _firstName;
  String? get middleName => _middleName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  String? get phoneCountryCode => _phoneCountryCode;
  String? get email => _email;
  String? get createdTime => _createdTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['registration_main_id'] = _registrationMainId;
    map['user_code'] = _userCode;
    map['first_name'] = _firstName;
    map['middle_name'] = _middleName;
    map['last_name'] = _lastName;
    map['phone_number'] = _phoneNumber;
    map['phone_country_code'] = _phoneCountryCode;
    map['email'] = _email;
    map['created_time'] = _createdTime;
    return map;
  }

}