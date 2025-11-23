import 'package:flutter/foundation.dart';
import 'package:glassy/model/glassy_post.dart';

@immutable
class GlassCollection {
  final String id;
  final String title;
  final String description;
  final String? coverImageUrl;
  final List<GlassyPost> posts;
  final bool isPrivate;

  const GlassCollection({
    required this.id,
    required this.title,
    required this.description,
    this.coverImageUrl,
    this.posts = const [],
    this.isPrivate = false,
  });

  GlassCollection copyWith({
    String? id,
    String? title,
    String? description,
    String? coverImageUrl,
    List<GlassyPost>? posts,
    bool? isPrivate,
  }) {
    return GlassCollection(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      posts: posts ?? this.posts,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }
}
