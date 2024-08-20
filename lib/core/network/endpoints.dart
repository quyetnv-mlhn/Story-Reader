import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  static const String getStories = '/stories';
  static const String getStoryDetails = '/stories/{id}';
  static const String getChapterContent = '/stories/{id}/chapters/{chapterId}';
  static const String getFeaturedStories = '/stories/featured';
  static const String getStoriesRecentlyUpdated = '/stories/recently-updated';
}
