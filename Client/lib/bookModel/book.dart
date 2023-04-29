import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

part 'book.g.dart';

@freezed
class Book with _$Book {
  const Book._();

  factory Book.book({
    //common
    required String bookID,
    required String title,
    required List<String> authorsID,
    required String numberOfPages,
    required String coverType,
    required String category,
    required String ISBN,
    required String language,
    required String publishedDate,
    required String publisherID,
    required String issueNumber,
    required String yearPublication,
    required String description,
    required String quantity,
    required List<String> images,

    // depends on post type
  }) = book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
