// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return TransactionModel(
    json['id'] as String,
    json['address'] as String,
    json['tin'] as String,
    json['contact'] as String,
    json['category'] as String,
    json['name'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'tin': instance.tin,
      'contact': instance.contact,
      'category': instance.category,
      'name': instance.name,
      'image': instance.image,
    };
