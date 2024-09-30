part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String gender;
  final String position;
  final String status;
  final String? profilePhoto;
  final Map<String, dynamic>? location;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.position,
    required this.status,
    this.profilePhoto,
    this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
