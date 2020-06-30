import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Author  {
  final String name;
  final String profilePicture;

  Author({@required this.name, @required this.profilePicture});
}

class NewsFeed extends Equatable {
  final String id;
  final Author author;
  //final String authorName;
  final List<String> images;
  final String title;
  final String text;
  final bool isLiked;
  final num likesCount;
  //final num commentsCount;
  final String createdAt;

  NewsFeed(
      {@required this.id,
      @required this.author,
      // @required this.authorName,
      @required this.images,
      @required this.title,
      @required this.text,
      @required this.isLiked,
      @required this.likesCount,
      // @required this.commentsCount,
      @required this.createdAt});

  @override
  List<Object> get props => [
        id,
        author,
        // authorName,

        title,
        images,
        text,
        isLiked,
        likesCount,
        // commentsCount,
        createdAt,
      ];
}
