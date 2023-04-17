import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
class Author with _$Author {
  const Author._();

  factory Author.author({
    //common
    required String authorID,
    required String authorName,

    // depends on post type

  }) = author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}