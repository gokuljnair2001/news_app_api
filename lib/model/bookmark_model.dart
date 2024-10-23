import 'package:hive_flutter/hive_flutter.dart';
part 'bookmark_model.g.dart';

@HiveType(typeId: 0)
class BookmarkModel {
  @HiveField(0)
  String? author;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? urlToImage;
  BookmarkModel({this.author, this.title, this.urlToImage});
}
