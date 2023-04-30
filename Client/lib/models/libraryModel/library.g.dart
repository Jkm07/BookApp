// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$libraryModel _$$libraryModelFromJson(Map<String, dynamic> json) =>
    _$libraryModel(
      libraryID: json['libraryID'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      librarianList: (json['librarianList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      booksAndQuantity:
          Map<String, String>.from(json['booksAndQuantity'] as Map),
    );

Map<String, dynamic> _$$libraryModelToJson(_$libraryModel instance) =>
    <String, dynamic>{
      'libraryID': instance.libraryID,
      'name': instance.name,
      'address': instance.address,
      'librarianList': instance.librarianList,
      'booksAndQuantity': instance.booksAndQuantity,
    };
