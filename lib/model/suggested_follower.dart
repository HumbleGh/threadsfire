import 'dart:convert';

class SuggestedFollower {
  final String id;
  final String username;
  final String profileImageUrl;
  final bool isFollowing;

  SuggestedFollower(
      {required this.id,
      required this.username,
      required this.profileImageUrl,
      required this.isFollowing});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'username': username});
    result.addAll({'profileImageUrl': profileImageUrl});
    result.addAll({'isFollowing': isFollowing});

    return result;
  }

  factory SuggestedFollower.fromMap(Map<String, dynamic> map) {
    return SuggestedFollower(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      isFollowing: map['isFollowing'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestedFollower.fromJson(String source) =>
      SuggestedFollower.fromMap(json.decode(source));
}

// Sample Users (Followers)
List<SuggestedFollower> suggestedFollowers = [
  SuggestedFollower(
      id: "1", username: "iamhumble", profileImageUrl: '', isFollowing: true),
  SuggestedFollower(
      id: "2", username: "callhumble", profileImageUrl: '', isFollowing: false),
  SuggestedFollower(
      id: "3", username: "yesiamhim", profileImageUrl: '', isFollowing: true),
  SuggestedFollower(
      id: "4", username: "imagine", profileImageUrl: '', isFollowing: true),
  SuggestedFollower(
      id: "5", username: "mbrella", profileImageUrl: '', isFollowing: false),
  SuggestedFollower(
      id: "6", username: "tumbel", profileImageUrl: '', isFollowing: true),
  SuggestedFollower(
      id: "7", username: "umbrella", profileImageUrl: '', isFollowing: false),
];
