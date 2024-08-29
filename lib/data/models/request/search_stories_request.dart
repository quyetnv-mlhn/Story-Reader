import 'package:story_reader/data/models/request/base_request.dart';

class SearchStoriesRequest extends BaseRequest {
  final String? title;
  final String? author;

  const SearchStoriesRequest({
    this.title,
    this.author,
    super.page = 1,
    super.pageSize = 10,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchStoriesRequest &&
        other.title == title &&
        other.author == author &&
        other.page == page &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode {
    return title.hashCode ^ author.hashCode ^ page.hashCode ^ pageSize.hashCode;
  }

  @override
  String toString() {
    return 'SearchStoriesRequest{title: $title, author: $author, page: $page, pageSize: $pageSize}';
  }

  SearchStoriesRequest copyWith({
    String? title,
    String? author,
    int? page,
    int? pageSize,
  }) {
    return SearchStoriesRequest(
      title: title ?? this.title,
      author: author ?? this.author,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'page': page,
      'pageSize': pageSize,
    };
  }

  factory SearchStoriesRequest.fromMap(Map<String, dynamic> map) {
    return SearchStoriesRequest(
      title: map['title'] as String?,
      author: map['author'] as String?,
      page: map['page'] as int? ?? 1,
      pageSize: map['pageSize'] as int? ?? 10,
    );
  }
}
