import 'package:story_reader/data/models/request/base_request.dart';

class GetStoriesRequest extends BaseRequest {
//<editor-fold desc="Data Methods">
  const GetStoriesRequest({
    required super.page,
    required super.pageSize,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GetStoriesRequest &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          pageSize == other.pageSize);

  @override
  int get hashCode => page.hashCode ^ pageSize.hashCode;

  @override
  String toString() {
    return 'GetStoriesParams{ page: $page, pageSize: $pageSize,}';
  }

  @override
  GetStoriesRequest copyWith({
    int? page,
    int? pageSize,
  }) {
    return GetStoriesRequest(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'pageSize': pageSize,
    };
  }

  factory GetStoriesRequest.fromMap(Map<String, dynamic> map) {
    return GetStoriesRequest(
      page: map['page'] as int,
      pageSize: map['pageSize'] as int,
    );
  }

//</editor-fold>
}
