// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$book _$$bookFromJson(Map<String, dynamic> json) => _$book(
      bookID: json['bookID'] as String,
      title: json['title'] as String,
      authorsID:
          (json['authorsID'] as List<dynamic>).map((e) => e as String).toList(),
      numberOfPages: json['numberOfPages'] as String,
      coverType: json['coverType'] as String,
      category: json['category'] as String,
      ISBN: json['ISBN'] as String,
      language: json['language'] as String,
      publishedDate: json['publishedDate'] as String,
      publisherID: json['publisherID'] as String,
      issueNumber: json['issueNumber'] as String,
      yearPublication: json['yearPublication'] as String,
      description: json['description'] as String,
      quantity: json['quantity'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$bookToJson(_$book instance) => <String, dynamic>{
      'bookID': instance.bookID,
      'title': instance.title,
      'authorsID': instance.authorsID,
      'numberOfPages': instance.numberOfPages,
      'coverType': instance.coverType,
      'category': instance.category,
      'ISBN': instance.ISBN,
      'language': instance.language,
      'publishedDate': instance.publishedDate,
      'publisherID': instance.publisherID,
      'issueNumber': instance.issueNumber,
      'yearPublication': instance.yearPublication,
      'description': instance.description,
      'quantity': instance.quantity,
      'images': instance.images,
    };
