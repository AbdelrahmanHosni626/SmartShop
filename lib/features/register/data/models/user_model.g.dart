// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  userId: json['userId'] as String,
  userName: json['userName'] as String,
  userEmail: json['userEmail'] as String,
  userImage: json['userImage'] as String?,
  userCart: json['userCart'] as List<dynamic>?,
  userWishlist: json['userWishlist'] as List<dynamic>?,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'userId': instance.userId,
  'userName': instance.userName,
  'userEmail': instance.userEmail,
  'userImage': instance.userImage,
  'userCart': instance.userCart,
  'userWishlist': instance.userWishlist,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
