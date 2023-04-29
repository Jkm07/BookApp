// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return book.fromJson(json);
}

/// @nodoc
mixin _$Book {
//common
  String get bookID => throw _privateConstructorUsedError;

  String get title => throw _privateConstructorUsedError;

  List<String> get authorsID => throw _privateConstructorUsedError;

  String get numberOfPages => throw _privateConstructorUsedError;

  String get coverType => throw _privateConstructorUsedError;

  String get category => throw _privateConstructorUsedError;

  String get ISBN => throw _privateConstructorUsedError;

  String get language => throw _privateConstructorUsedError;

  String get publishedDate => throw _privateConstructorUsedError;

  String get publisherID => throw _privateConstructorUsedError;

  String get issueNumber => throw _privateConstructorUsedError;

  String get yearPublication => throw _privateConstructorUsedError;

  String get description => throw _privateConstructorUsedError;

  String get quantity => throw _privateConstructorUsedError;

  List<String> get images => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String bookID,
            String title,
            List<String> authorsID,
            String numberOfPages,
            String coverType,
            String category,
            String ISBN,
            String language,
            String publishedDate,
            String publisherID,
            String issueNumber,
            String yearPublication,
            String description,
            String quantity,
            List<String> images)
        book,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String bookID,
            String title,
            List<String> authorsID,
            String numberOfPages,
            String coverType,
            String category,
            String ISBN,
            String language,
            String publishedDate,
            String publisherID,
            String issueNumber,
            String yearPublication,
            String description,
            String quantity,
            List<String> images)?
        book,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String bookID,
            String title,
            List<String> authorsID,
            String numberOfPages,
            String coverType,
            String category,
            String ISBN,
            String language,
            String publishedDate,
            String publisherID,
            String issueNumber,
            String yearPublication,
            String description,
            String quantity,
            List<String> images)?
        book,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(book value) book,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(book value)? book,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(book value)? book,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String bookID,
      String title,
      List<String> authorsID,
      String numberOfPages,
      String coverType,
      String category,
      String ISBN,
      String language,
      String publishedDate,
      String publisherID,
      String issueNumber,
      String yearPublication,
      String description,
      String quantity,
      List<String> images});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookID = null,
    Object? title = null,
    Object? authorsID = null,
    Object? numberOfPages = null,
    Object? coverType = null,
    Object? category = null,
    Object? ISBN = null,
    Object? language = null,
    Object? publishedDate = null,
    Object? publisherID = null,
    Object? issueNumber = null,
    Object? yearPublication = null,
    Object? description = null,
    Object? quantity = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      bookID: null == bookID
          ? _value.bookID
          : bookID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authorsID: null == authorsID
          ? _value.authorsID
          : authorsID // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as String,
      coverType: null == coverType
          ? _value.coverType
          : coverType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ISBN: null == ISBN
          ? _value.ISBN
          : ISBN // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      publisherID: null == publisherID
          ? _value.publisherID
          : publisherID // ignore: cast_nullable_to_non_nullable
              as String,
      issueNumber: null == issueNumber
          ? _value.issueNumber
          : issueNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearPublication: null == yearPublication
          ? _value.yearPublication
          : yearPublication // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$bookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$bookCopyWith(_$book value, $Res Function(_$book) then) =
      __$$bookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookID,
      String title,
      List<String> authorsID,
      String numberOfPages,
      String coverType,
      String category,
      String ISBN,
      String language,
      String publishedDate,
      String publisherID,
      String issueNumber,
      String yearPublication,
      String description,
      String quantity,
      List<String> images});
}

/// @nodoc
class __$$bookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$book>
    implements _$$bookCopyWith<$Res> {
  __$$bookCopyWithImpl(_$book _value, $Res Function(_$book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookID = null,
    Object? title = null,
    Object? authorsID = null,
    Object? numberOfPages = null,
    Object? coverType = null,
    Object? category = null,
    Object? ISBN = null,
    Object? language = null,
    Object? publishedDate = null,
    Object? publisherID = null,
    Object? issueNumber = null,
    Object? yearPublication = null,
    Object? description = null,
    Object? quantity = null,
    Object? images = null,
  }) {
    return _then(_$book(
      bookID: null == bookID
          ? _value.bookID
          : bookID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      authorsID: null == authorsID
          ? _value._authorsID
          : authorsID // ignore: cast_nullable_to_non_nullable
              as List<String>,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as String,
      coverType: null == coverType
          ? _value.coverType
          : coverType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ISBN: null == ISBN
          ? _value.ISBN
          : ISBN // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as String,
      publisherID: null == publisherID
          ? _value.publisherID
          : publisherID // ignore: cast_nullable_to_non_nullable
              as String,
      issueNumber: null == issueNumber
          ? _value.issueNumber
          : issueNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearPublication: null == yearPublication
          ? _value.yearPublication
          : yearPublication // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$book extends book {
  _$book(
      {required this.bookID,
      required this.title,
      required final List<String> authorsID,
      required this.numberOfPages,
      required this.coverType,
      required this.category,
      required this.ISBN,
      required this.language,
      required this.publishedDate,
      required this.publisherID,
      required this.issueNumber,
      required this.yearPublication,
      required this.description,
      required this.quantity,
      required final List<String> images})
      : _authorsID = authorsID,
        _images = images,
        super._();

  factory _$book.fromJson(Map<String, dynamic> json) => _$$bookFromJson(json);

//common
  @override
  final String bookID;
  @override
  final String title;
  final List<String> _authorsID;
  @override
  List<String> get authorsID {
    if (_authorsID is EqualUnmodifiableListView) return _authorsID;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorsID);
  }

  @override
  final String numberOfPages;
  @override
  final String coverType;
  @override
  final String category;
  @override
  final String ISBN;
  @override
  final String language;
  @override
  final String publishedDate;
  @override
  final String publisherID;
  @override
  final String issueNumber;
  @override
  final String yearPublication;
  @override
  final String description;
  @override
  final String quantity;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
// ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'Book.book(bookID: $bookID, title: $title, authorsID: $authorsID, numberOfPages: $numberOfPages, coverType: $coverType, category: $category, ISBN: $ISBN, language: $language, publishedDate: $publishedDate, publisherID: $publisherID, issueNumber: $issueNumber, yearPublication: $yearPublication, description: $description, quantity: $quantity, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$book &&
            (identical(other.bookID, bookID) || other.bookID == bookID) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._authorsID, _authorsID) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages) &&
            (identical(other.coverType, coverType) ||
                other.coverType == coverType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.ISBN, ISBN) || other.ISBN == ISBN) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.publisherID, publisherID) ||
                other.publisherID == publisherID) &&
            (identical(other.issueNumber, issueNumber) ||
                other.issueNumber == issueNumber) &&
            (identical(other.yearPublication, yearPublication) ||
                other.yearPublication == yearPublication) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookID,
      title,
      const DeepCollectionEquality().hash(_authorsID),
      numberOfPages,
      coverType,
      category,
      ISBN,
      language,
      publishedDate,
      publisherID,
      issueNumber,
      yearPublication,
      description,
      quantity,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$bookCopyWith<_$book> get copyWith =>
      __$$bookCopyWithImpl<_$book>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String bookID,
            String title,
            List<String> authorsID,
            String numberOfPages,
            String coverType,
            String category,
            String ISBN,
            String language,
            String publishedDate,
            String publisherID,
            String issueNumber,
            String yearPublication,
            String description,
            String quantity,
            List<String> images)
        book,
  }) {
    return book(
        bookID,
        title,
        authorsID,
        numberOfPages,
        coverType,
        category,
        ISBN,
        language,
        publishedDate,
        publisherID,
        issueNumber,
        yearPublication,
        description,
        quantity,
        images);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String bookID,
            String title,
            List<String> authorsID,
            String numberOfPages,
            String coverType,
            String category,
            String ISBN,
            String language,
            String publishedDate,
            String publisherID,
            String issueNumber,
            String yearPublication,
            String description,
            String quantity,
            List<String> images)?
        book,
  }) {
    return book?.call(
        bookID,
        title,
        authorsID,
        numberOfPages,
        coverType,
        category,
        ISBN,
        language,
        publishedDate,
        publisherID,
        issueNumber,
        yearPublication,
        description,
        quantity,
        images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String bookID,
            String title,
            List<String> authorsID,
            String numberOfPages,
            String coverType,
            String category,
            String ISBN,
            String language,
            String publishedDate,
            String publisherID,
            String issueNumber,
            String yearPublication,
            String description,
            String quantity,
            List<String> images)?
        book,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(
          bookID,
          title,
          authorsID,
          numberOfPages,
          coverType,
          category,
          ISBN,
          language,
          publishedDate,
          publisherID,
          issueNumber,
          yearPublication,
          description,
          quantity,
          images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(book value) book,
  }) {
    return book(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(book value)? book,
  }) {
    return book?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(book value)? book,
    required TResult orElse(),
  }) {
    if (book != null) {
      return book(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$bookToJson(
      this,
    );
  }
}

abstract class book extends Book {
  factory book(
      {required final String bookID,
      required final String title,
      required final List<String> authorsID,
      required final String numberOfPages,
      required final String coverType,
      required final String category,
      required final String ISBN,
      required final String language,
      required final String publishedDate,
      required final String publisherID,
      required final String issueNumber,
      required final String yearPublication,
      required final String description,
      required final String quantity,
      required final List<String> images}) = _$book;
  book._() : super._();

  factory book.fromJson(Map<String, dynamic> json) = _$book.fromJson;

  @override //common
  String get bookID;
  @override
  String get title;
  @override
  List<String> get authorsID;
  @override
  String get numberOfPages;
  @override
  String get coverType;
  @override
  String get category;
  @override
  String get ISBN;
  @override
  String get language;
  @override
  String get publishedDate;
  @override
  String get publisherID;
  @override
  String get issueNumber;
  @override
  String get yearPublication;
  @override
  String get description;
  @override
  String get quantity;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$bookCopyWith<_$book> get copyWith => throw _privateConstructorUsedError;
}
