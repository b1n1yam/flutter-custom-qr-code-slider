import 'package:json_annotation/json_annotation.dart';

part 'transactionModel.g.dart';

@JsonSerializable()
class TransactionModel {
  String id;
  String address;
  String tin;
  String contact;
  String category;
  String name;
  String image;

  TransactionModel(this.id, this.address, this.tin, this.contact, this.category,
      this.name, this.image);

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
