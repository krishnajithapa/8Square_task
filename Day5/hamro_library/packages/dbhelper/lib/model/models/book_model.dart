import 'package:json_annotation/json_annotation.dart';

part 'book_model.g.dart';

@JsonSerializable()
class Book {
  @JsonKey(name: "_id", defaultValue: 0, includeIfNull: true)
  final int id;

  @JsonKey(name: "bookName", defaultValue: '', includeIfNull: true)
  final String bookName;

  @JsonKey(name: "author", defaultValue: '', includeIfNull: true)
  final String author;

  @JsonKey(name: "catagory", defaultValue: '', includeIfNull: true)
  final String catagory;

  @JsonKey(name: "price", defaultValue: 0, includeIfNull: true)
  final int price;

  Book(
      {required this.id,
      required this.bookName,
      required this.catagory,
      required this.price,
      required this.author});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
