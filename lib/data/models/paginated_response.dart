class PaginatedResponse<T> {
  final List<T> content;
  final int page;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool hasNext;

  const PaginatedResponse({
    required this.content,
    required this.page,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.hasNext,
  });

  factory PaginatedResponse.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) fromMapT,
  ) {
    return PaginatedResponse<T>(
      content: (map['content'] as List<dynamic>)
          .map((item) => fromMapT(item as Map<String, dynamic>))
          .toList(),
      page: map['page'] as int,
      size: map['size'] as int,
      totalElements: map['totalElements'] as int,
      totalPages: map['totalPages'] as int,
      hasNext: map['hasNext'] as bool,
    );
  }

  Map<String, dynamic> toMap(
    Map<String, dynamic> Function(T) toMapT,
  ) {
    return {
      'content': content.map((item) => toMapT(item)).toList(),
      'page': page,
      'size': size,
      'totalElements': totalElements,
      'totalPages': totalPages,
      'hasNext': hasNext,
    };
  }
}
