import 'package:freezed_annotation/freezed_annotation.dart';

part 'userLibrary.freezed.dart';

part 'userLibrary.g.dart';

@freezed
class UserLibrary with _$UserLibrary {
  const UserLibrary._();

  factory UserLibrary.user({
    //common
    required String userID,
    required String userName,
    required String userMail,
    required String userType,

    // depends on post type
  }) = userLibrary;

  factory UserLibrary.fromJson(Map<String, dynamic> json) =>
      _$UserLibraryFromJson(json);
}
