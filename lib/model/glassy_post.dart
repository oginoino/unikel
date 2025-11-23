import 'package:flutter/foundation.dart';

@immutable
class GlassyPost {
  final String id;
  final String authorName;
  final String authorHandle;
  final String? authorAvatarUrl;
  final String content;
  final DateTime timestamp;
  final int applauseCount;
  final int recommendCount;
  final bool isApplauded;
  final bool isRecommended;

  const GlassyPost({
    required this.id,
    required this.authorName,
    required this.authorHandle,
    this.authorAvatarUrl,
    required this.content,
    required this.timestamp,
    this.applauseCount = 0,
    this.recommendCount = 0,
    this.isApplauded = false,
    this.isRecommended = false,
  });

  GlassyPost copyWith({
    String? id,
    String? authorName,
    String? authorHandle,
    String? authorAvatarUrl,
    String? content,
    DateTime? timestamp,
    int? applauseCount,
    int? recommendCount,
    bool? isApplauded,
    bool? isRecommended,
  }) {
    return GlassyPost(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
      authorHandle: authorHandle ?? this.authorHandle,
      authorAvatarUrl: authorAvatarUrl ?? this.authorAvatarUrl,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      applauseCount: applauseCount ?? this.applauseCount,
      recommendCount: recommendCount ?? this.recommendCount,
      isApplauded: isApplauded ?? this.isApplauded,
      isRecommended: isRecommended ?? this.isRecommended,
    );
  }
}
