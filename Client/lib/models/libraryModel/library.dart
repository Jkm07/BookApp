import 'package:freezed_annotation/freezed_annotation.dart';

part 'library.freezed.dart';

part 'library.g.dart';

@freezed
class Library with _$Library {
  const Library._();

  factory Library.library({
    //common
    required String libraryID,
    required String name,
    required String address,
    required List<String> librarianList,
    required Map<String, String> booksAndQuantity,

    // depends on post type
  }) = libraryModel;

  factory Library.fromJson(Map<String, dynamic> json) =>
      _$LibraryFromJson(json);
}
