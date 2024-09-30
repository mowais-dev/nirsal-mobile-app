part of 'objects.dart';

@JsonSerializable(explicitToJson: true)
class ResponseModel {
  final String status;
  final dynamic data;
  final dynamic meta;
  final String message;

  ResponseModel({
    required this.status,
    required this.data,
    this.meta,
    required this.message,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
