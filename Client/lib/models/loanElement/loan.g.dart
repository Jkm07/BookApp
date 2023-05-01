// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$loan _$$loanFromJson(Map<String, dynamic> json) => _$loan(
      bookID: json['bookID'] as String,
      libraryID: json['libraryID'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$$loanToJson(_$loan instance) => <String, dynamic>{
      'bookID': instance.bookID,
      'libraryID': instance.libraryID,
      'quantity': instance.quantity,
    };
