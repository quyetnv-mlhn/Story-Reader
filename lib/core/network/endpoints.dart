class Endpoints {
  // static const String baseUrl = 'http://192.168.50.4:8080/api';  //company
  static const String baseUrl = 'http://192.168.1.65:8080/api'; //house
  static const String getStories = '/stories';
  static const String getStoryDetails = '/stories/{id}';
  static const String getChapterContent = '/stories/{id}/chapters/{chapterId}';
}
