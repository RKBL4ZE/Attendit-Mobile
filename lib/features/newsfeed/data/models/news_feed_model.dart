import 'package:Attendit/features/newsfeed/domain/entities/news_feed.dart';
import 'package:meta/meta.dart';

class AuthorModel extends Author {
  AuthorModel({
    @required final String name,
    @required final String profilePicture,
  }) : super(name: name, profilePicture: profilePicture);

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json['name'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePicture': profilePicture,
    };
  }
}

class NewsFeedModel extends NewsFeed {
  NewsFeedModel({
    @required final String id,
    @required final AuthorModel author,
    @required final List<String> images,
    @required final String title,
    @required final String text,
    @required final bool isLiked,
    @required final num likesCount,
   // @required final num commentsCount,
    @required final String createdAt,
  }) : super(
          id: id,
          author: author,
          images: images,
          title: title,
          text: text,
          isLiked: isLiked,
          likesCount: likesCount,
         // commentsCount: commentsCount,
          createdAt: createdAt,
        );

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) {
    return NewsFeedModel(
      id: json['id'],
      author: AuthorModel.fromJson(json['author']),
      images: List.from(json['images']),
      title: json['title'],
      text: json['text'],
      isLiked: json['isLiked'],
      likesCount: json['likesCount'],
     // commentsCount: json['commentsCount'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'author': author,
      'images': images,
      'title': title,
      'text': text,
      'isLiked': isLiked,
      'likesCount': likesCount,
      //'commentsCount': commentsCount,
      'createdAt': createdAt,
    };
  }
}
