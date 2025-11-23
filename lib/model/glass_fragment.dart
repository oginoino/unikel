import 'package:flutter/foundation.dart';
import 'package:glassy/model/glassy_post.dart';

@immutable
class GlassFragment {
  final String id;
  final String title;
  final String description;
  final String? coverImageUrl;
  final List<GlassyPost> posts;
  final int subscriberCount;
  final bool isPrivate;

  const GlassFragment({
    required this.id,
    required this.title,
    required this.description,
    this.coverImageUrl,
    this.posts = const [],
    this.subscriberCount = 0,
    this.isPrivate = false,
  });

  GlassFragment copyWith({
    String? id,
    String? title,
    String? description,
    String? coverImageUrl,
    List<GlassyPost>? posts,
    int? subscriberCount,
    bool? isPrivate,
  }) {
    return GlassFragment(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      posts: posts ?? this.posts,
      subscriberCount: subscriberCount ?? this.subscriberCount,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }
}
