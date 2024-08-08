class SearchStoriesParam {
  final String? title;
  final String? author;

//<editor-fold desc="Data Methods">
  const SearchStoriesParam({
    this.title,
    this.author,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchStoriesParam &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          author == other.author);

  @override
  int get hashCode => title.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'SearchStoriesParam{ title: $title, author: $author,}';
  }

  SearchStoriesParam copyWith({
    String? title,
    String? author,
  }) {
    return SearchStoriesParam(
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

  factory SearchStoriesParam.fromMap(Map<String, dynamic> map) {
    return SearchStoriesParam(
      title: map['title'] as String,
      author: map['author'] as String,
    );
  }

//</editor-fold>
}
