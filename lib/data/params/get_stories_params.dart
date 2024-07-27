class GetStoriesParams {
  final int? page;
  final int? pageSize;

//<editor-fold desc="Data Methods">
  const GetStoriesParams({
    this.page,
    this.pageSize,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GetStoriesParams &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          pageSize == other.pageSize);

  @override
  int get hashCode => page.hashCode ^ pageSize.hashCode;

  @override
  String toString() {
    return 'GetStoriesParams{ page: $page, pageSize: $pageSize,}';
  }

  GetStoriesParams copyWith({
    int? page,
    int? pageSize,
  }) {
    return GetStoriesParams(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
    };
  }

  factory GetStoriesParams.fromMap(Map<String, dynamic> map) {
    return GetStoriesParams(
      page: map['page'] as int,
      pageSize: map['pageSize'] as int,
    );
  }

//</editor-fold>
}
