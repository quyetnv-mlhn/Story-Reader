class Endpoints {
  static const String baseUrl = 'http://192.168.1.9:8080/api';
  static const String getStories = '/stories';
  static const String getStoryDetails = '/stories/{id}';
  static const String getChapterContent = '/stories/{id}/chapters/{chapterId}';
}
