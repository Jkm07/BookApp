// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$loan _$$loanFromJson(Map<String, dynamic> json) => _$loan(
      loanID: json['loanID'] as String,
      bookID: json['bookID'] as String,
      libraryID: json['libraryID'] as String,
      userID: json['userID'] as String,
      loanDate: DateTime.parse(json['loanDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      extended: json['extended'] as bool,
      ended: json['ended'] as bool,
    );

Map<String, dynamic> _$$loanToJson(_$loan instance) => <String, dynamic>{
      'loanID': instance.loanID,
      'bookID': instance.bookID,
      'libraryID': instance.libraryID,
      'userID': instance.userID,
      'loanDate': instance.loanDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'extended': instance.extended,
      'ended': instance.ended,
    };
