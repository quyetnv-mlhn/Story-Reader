class Story {
  final int? id;
  final String? title;
  final String? author;
  final String? description;
  final String? coverImage;
  final String? publishedDate;
  final String? status;

//<editor-fold desc="Data Methods">
  const Story({
    this.id,
    this.title,
    this.author,
    this.description,
    this.coverImage,
    this.publishedDate,
    this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Story &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          author == other.author &&
          description == other.description &&
          coverImage == other.coverImage &&
          publishedDate == other.publishedDate &&
          status == other.status);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      author.hashCode ^
      description.hashCode ^
      coverImage.hashCode ^
      publishedDate.hashCode ^
      status.hashCode;

  @override
  String toString() {
    return 'Story{ id: $id, title: $title, author: $author, description: $description, coverImage: $coverImage, publishedDate: $publishedDate, status: $status,}';
  }

  Story copyWith({
    int? id,
    String? title,
    String? author,
    String? description,
    String? coverImage,
    String? publishedDate,
    String? status,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      description: description ?? this.description,
      coverImage: coverImage ?? this.coverImage,
      publishedDate: publishedDate ?? this.publishedDate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'coverImage': coverImage,
      'publishedDate': publishedDate,
      'status': status,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] as int,
      title: map['title'] as String,
      author: map['author'] as String,
      description: map['description'] as String,
      coverImage: map['coverImage'] as String,
      publishedDate: map['publishedDate'] as String,
      status: map['status'] as String,
    );
  }

//</editor-fold>
}
