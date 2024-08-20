class BaseRequest {
  final int page;
  final int pageSize;

//<editor-fold desc="Data Methods">
  const BaseRequest({
    required this.page,
    required this.pageSize,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseRequest &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          pageSize == other.pageSize);

  @override
  int get hashCode => page.hashCode ^ pageSize.hashCode;

  @override
  String toString() {
    return 'BaseRequest{' + ' page: $page,' + ' pageSize: $pageSize,' + '}';
  }

  BaseRequest copyWith({
    int? page,
    int? pageSize,
  }) {
    return BaseRequest(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': this.page,
      'pageSize': this.pageSize,
    };
  }

  factory BaseRequest.fromMap(Map<String, dynamic> map) {
    return BaseRequest(
      page: map['page'] as int,
      pageSize: map['pageSize'] as int,
    );
  }

//</editor-fold>
}
