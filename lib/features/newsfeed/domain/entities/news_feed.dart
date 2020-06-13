import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NewsFeed extends Equatable {
  final String id;
  final String authorName;
  final String authorAvatar;
  final String title;
  final String data;
  final bool isLiked;
  final num likesCount;
  final num commentsCount;
  final num postTime;

  NewsFeed(
      {@required this.id,
      @required this.authorName,
      @required this.authorAvatar,
      @required this.title,
      @required this.data,
      @required this.isLiked,
      @required this.likesCount,
      @required this.commentsCount,
      @required this.postTime});

  @override
  List<Object> get props => [
        id,
        authorName,
        authorAvatar,
        title,
        data,
        isLiked,
        likesCount,
        commentsCount,
        postTime,
      ];
}
