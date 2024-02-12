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
      timestamp: DateTime.now().subtract(const Duration(hours: 23)),
      likesCount: 2,
      retweetCount: 3,
      commentCount: 32),
  ThreadMessage(
      id: "2",
      senderName: "Abena Nyarko",
      senderProfileImageUrl: "profile_url_2.jpg",
      message: "For God love the world, that He gave us his only begotten son",
      timestamp: DateTime.now().subtract(const Duration(days: 20)),
      likesCount: 232,
      retweetCount: 44,
      commentCount: 52),
  ThreadMessage(
      id: "3",
      senderName: "Nimako Prempeh",
      senderProfileImageUrl: "profile_url_3.jpg",
      message:
          "That who so ever believes in him, should not perish, but have eternal life.",
      timestamp: DateTime.now().subtract(const Duration(minutes: 11)),
      likesCount: 92,
      retweetCount: 76,
      commentCount: 10),
  ThreadMessage(
      id: "4",
      senderName: "Ella Boat",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(days: 32)),
      likesCount: 22,
      retweetCount: 14,
      commentCount: 52),
  ThreadMessage(
      id: "5",
      senderName: "Safo Neuman",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(minutes: 300)),
      likesCount: 32,
      retweetCount: 40,
      commentCount: 52),
  ThreadMessage(
      id: "6",
      senderName: "Jude Gadabui",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He knows what is best for His children",
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      likesCount: 3,
      retweetCount: 4,
      commentCount: 2),
  ThreadMessage(
      id: "7",
      senderName: "Kwame Kwaning",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      likesCount: 22,
      retweetCount: 5434,
      commentCount: 32),
  ThreadMessage(
      id: "7",
      senderName: "Kwame Kwaning",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      likesCount: 22,
      retweetCount: 5434,
      commentCount: 32),
  ThreadMessage(
      id: "7",
      senderName: "Kwame Kwaning",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      likesCount: 22,
      retweetCount: 5434,
      commentCount: 32),
  ThreadMessage(
      id: "7",
      senderName: "Kwame Kwaning",
      senderProfileImageUrl: "profile_url_4.jpg",
      message: "He God said, He is with me in all things, So I fear no one",
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
      likesCount: 22,
      retweetCount: 5434,
      commentCount: 32),
];
