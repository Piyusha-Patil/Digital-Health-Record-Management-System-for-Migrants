class AppNotification {
  final String id;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool read;
  final String? targetScreen; // optional: deep-link target

  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    DateTime? createdAt,
    this.read = false,
    this.targetScreen,
  }) : this.createdAt = createdAt ?? DateTime.now();

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      read: json['read'] ?? false,
      targetScreen: json['targetScreen'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'createdAt': createdAt.toIso8601String(),
    'read': read,
    'targetScreen': targetScreen,
  };
}
