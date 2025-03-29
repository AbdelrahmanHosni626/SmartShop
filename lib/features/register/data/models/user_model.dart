import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String userId;
  final String userName;
  final String userEmail;
  final String? userImage;
  final List<dynamic>? userCart;
  final List<dynamic>? userWishlist;

  @TimestampConverter()
  final Timestamp? createdAt;

  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userImage,
    required this.userCart,
    required this.userWishlist,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

class TimestampConverter implements JsonConverter<Timestamp?, dynamic> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(dynamic json) {
    if (json == null) return null;
    return json is Timestamp
        ? json
        : Timestamp.fromMillisecondsSinceEpoch(json as int);
  }

  @override
  dynamic toJson(Timestamp? timestamp) {
    return timestamp?.millisecondsSinceEpoch;
  }
}
