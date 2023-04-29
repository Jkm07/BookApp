import 'package:freezed_annotation/freezed_annotation.dart';

part 'publisher.freezed.dart';

part 'publisher.g.dart';

@freezed
class Publisher with _$Publisher {
  const Publisher._();

  factory Publisher.publisher({
    //common
    required String publisherID,
    required String publisherName,

    // depends on post type
  }) = publisher;

  factory Publisher.fromJson(Map<String, dynamic> json) =>
      _$PublisherFromJson(json);
}
