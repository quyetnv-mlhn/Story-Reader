class SearchStoriesRequest {
  final String? title;
  final String? author;

//<editor-fold desc="Data Methods">
  const SearchStoriesRequest({
    this.title,
    this.author,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchStoriesRequest &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author);

  @override
  int get hashCode => title.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'SearchStoriesParam{ title: $title, author: $author,}';
  }

  SearchStoriesRequest copyWith({
    String? title,
    String? author,
  }) {
    return SearchStoriesRequest(
      title: title ?? this.title,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
    };
  }

  factory SearchStoriesRequest.fromMap(Map<String, dynamic> map) {
    return SearchStoriesRequest(
      title: map['title'] as String,
      author: map['author'] as String,
    );
  }

//</editor-fold>
}
