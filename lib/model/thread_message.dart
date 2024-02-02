import 'dart:convert';

class ThreadMessage {
  final String id;
  final String senderName;
  final String senderProfileImageUrl;
  final String message;
  final DateTime timestamp;
  final int likesCount;
  final int retweetCount;
  final int commentCount;

  ThreadMessage({
    required this.id,
    required this.senderName,
    required this.senderProfileImageUrl,
    required this.message,
    required this.timestamp,
    required this.likesCount,
    required this.retweetCount,
    required this.commentCount,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'senderName': senderName});
    result.addAll({'senderProfileImageUrl': senderProfileImageUrl});
    result.addAll({'message': message});
    result.addAll({'timestamp': timestamp.millisecondsSinceEpoch});
    result.addAll({'likesCount': likesCount});
    result.addAll({'retweetCount': retweetCount});
    result.addAll({'commentCount': commentCount});

    return result;
  }

  factory ThreadMessage.fromMap(Map<String, dynamic> map) {
    return ThreadMessage(
      id: map['id'] ?? '',
      senderName: map['senderName'] ?? '',
      senderProfileImageUrl: map['senderProfileImageUrl'] ?? '',
      message: map['message'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      likesCount: map['likesCount']?.toInt() ?? 0,
      retweetCount: map['retweetCount']?.toInt() ?? 0,
      commentCount: map['commentCount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThreadMessage.fromJson(String source) =>
      ThreadMessage.fromMap(json.decode(source));
}

List<ThreadMessage> threadMessages = [
  ThreadMessage(
      id: "1",
      senderName: "Humble Osei",
      senderProfileImageUrl: "profile_url_1.jpg",
      message:
          "Hey Man, I am here to stay regardless of whatever that may happen",
      timestamp: DateTime.now().subtract(const Duration(minutes: 23)),
      likesCount: 2,
      retweetCount: 3,
      commentCount: 32),
  ThreadMessage(
      id: "2",
      senderName: "Abena Nyarko",
      senderProfileImageUrl: "profile_url_2.jpg",
      message:
          "For God do love the world, that He gave us his only begotten son",
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      likesCount: 232,
      retweetCount: 44,
      commentCount: 52),
  ThreadMessage(
      id: "3",
      senderName: "Nimako Prempeh",
      senderProfileImageUrl: "profile_url_3.jpg",
      message:
          "That who so ever believes in him, should not perish, but have eternal life.",
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      likesCount: 232,
      retweetCount: 44,
      commentCount: 52),
  ThreadMessage(
      id: "4",
      senderName: "Ella Boat",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      likesCount: 232,
      retweetCount: 44,
      commentCount: 52),
];
