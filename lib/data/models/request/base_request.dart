class BaseRequest {
  final int page;
  final int pageSize;

  const BaseRequest({
    required this.page,
    required this.pageSize,
  });

  @override
  String toString() {
    return 'BaseRequest{page: $page, pageSize: $pageSize}';
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
    };
  }

  factory BaseRequest.fromMap(Map<String, dynamic> map) {
    return BaseRequest(
      page: map['page'] as int,
      pageSize: map['pageSize'] as int,
    );
  }
}
