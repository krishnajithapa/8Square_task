// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['_id'] as int? ?? 0,
      bookName: json['bookName'] as String? ?? '',
      catagory: json['catagory'] as String? ?? '',
      price: json['price'] as int? ?? 0,
      author: json['author'] as String? ?? '',
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      '_id': instance.id,
      'bookName': instance.bookName,
      'author': instance.author,
      'catagory': instance.catagory,
      'price': instance.price,
    };
