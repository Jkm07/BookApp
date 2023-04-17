import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(unionKey: 'userType')
class User with _$User {
  const User._();

  @FreezedUnionValue('reader')
  factory User.reader({
    //common
    required String userName,
    required String userSurname,
    required String userType,
    required String userID,

    // depends on post type


  }) = UserReader;

  @FreezedUnionValue('librarian')
  factory User.librarian({
    //common
    required String userName,
    required String userSurname,
    required String userType,
    required String userID,

    // depends on post type


  }) = UserLibrarian;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}