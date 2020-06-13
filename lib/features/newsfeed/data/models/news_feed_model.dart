import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:meta/meta.dart';



class NewsFeedModel extends NewsFeed {
  NewsFeedModel({

   @required final String id,
  @required final String authorName,
  @required final String authorAvatar,
  @required final String title,
  @required final String data,
  @required final bool isLiked,
  @required final num likesCount,
  @required final num commentsCount,
  @required final num postTime,
  }) : super(
          id: id,
          authorName: authorName,
          authorAvatar: authorAvatar,
          title: title,
          data: data,
          isLiked: isLiked,
          likesCount: likesCount,
          commentsCount: commentsCount,
          postTime: postTime,
          
        );

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) {
    return NewsFeedModel(
      id: json['id'],
      authorName: json['authorName'],
      authorAvatar: json['authorAvatar'],
      title: json['title'],
      data: json['data'],
      isLiked: json['isLiked'],
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
      postTime: json['postTime'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorName': authorName,
      'authorAvatar': authorAvatar,
      'title': title,
      'data': data,
      'isLiked': isLiked,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'postTime': postTime,
      
    };
  }
}
