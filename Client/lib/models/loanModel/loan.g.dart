// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$loan _$$loanFromJson(Map<String, dynamic> json) => _$loan(
      loanID: json['loanID'] as String,
      bookID: json['bookID'] as String,
      customerID: json['customerID'] as String,
      loanDate: json['loanDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$$loanToJson(_$loan instance) => <String, dynamic>{
      'loanID': instance.loanID,
      'bookID': instance.bookID,
      'customerID': instance.customerID,
      'loanDate': instance.loanDate,
      'endDate': instance.endDate,
    };
