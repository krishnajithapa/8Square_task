import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserDataModel {
  String nationality;
  String firstName;
  String lastName;
  String idNumber;
  String gender;
  String dob;
  bool residentalStatus;
  UserDataModel({
    required this.nationality,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.idNumber,
    required this.residentalStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nationality': nationality,
      'firstName': firstName,
      'lastName': lastName,
      'idNumber': idNumber,
      'gender': gender,
      'dob': dob,
      'residentalStatus': residentalStatus,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      nationality: map['nationality'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      idNumber: map['idNumber'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
      residentalStatus: map['residentalStatus'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataModel.fromJson(String source) =>
      UserDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
