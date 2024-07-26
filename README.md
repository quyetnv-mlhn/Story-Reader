# story_reader

|____core
| |____network
| | |____api_client.dart
| | |____endpoints.dart
| |____utils
| | |____constants.dart
| | |____date_formatter.dart
| | |____string_extensions.dart
| |____error
| | |____exceptions.dart
| | |____failure.dart
| |____theme
| | |____app_colors.dart
| | |____app_text_styles.dart
|____app
| |____app_bloc_observer.dart
| |____app.dart
|____main.dart
|____feature
| |____home
| | |____presentation
| | | |____pages
| | | | |____home_page.dart
| | | |____widgets
| | | | |____story_card.dart
| | | |____bloc
| | | | |____home_bloc.dart
| | | | |____home_event.dart
| | | | |____home_state.dart
| |____story_details
| | |____presentation
| | | |____pages
| | | | |____story_details_page.dart
| | | |____widgets
| | | | |____chapter_list_item.dart
| | | |____bloc
| | | | |____story_details_bloc.dart
| | | | |____story_details_event.dart
| | | | |____story_details_state.dart
| |____reader
| | |____presentation
| | | |____pages
| | | | |____reader_page.dart
| | | |____widgets
| | | | |____text_content.dart
| | | |____bloc
| | | | |____reader_bloc.dart
| | | | |____reader_event.dart
| | | | |____reader_state.dart
|____data
| |____repositories
| | |____story_repository_impl.dart
| |____datasources
| | |____remote
| | | |____story_remote_data_source.dart
| | |____local
| | | |____story_local_data_source.dart
| |____models
| | |____story_model.dart
| | |____chapter_model.dart
|____domain
| |____entities
| | |____story.dart
| | |____chapter.dart
| |____repositories
| | |____story_repository.dart
| |____usecases
| | |____get_stories.dart
| | |____get_story_details.dart
| | |____get_chapter_content.dart
|____injection_container.dart
