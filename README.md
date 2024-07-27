story_reader
│
├── core
│   ├── network
│   │   ├── api_client.dart
│   │   └── endpoints.dart
│   ├── utils
│   │   ├── constants.dart
│   │   ├── date_formatter.dart
│   │   └── string_extensions.dart
│   ├── error
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   └── theme
│       ├── app_colors.dart
│       └── app_text_styles.dart
│
├── app
│   ├── app_bloc_observer.dart
│   └── app.dart
│
├── main.dart
│
├── feature
│   ├── home
│   │   └── presentation
│   │       ├── pages
│   │       │   └── home_page.dart
│   │       ├── widgets
│   │       │   └── story_card.dart
│   │       └── bloc
│   │           ├── home_bloc.dart
│   │           ├── home_event.dart
│   │           └── home_state.dart
│   │
│   ├── story_details
│   │   └── presentation
│   │       ├── pages
│   │       │   └── story_details_page.dart
│   │       ├── widgets
│   │       │   └── chapter_list_item.dart
│   │       └── bloc
│   │           ├── story_details_bloc.dart
│   │           ├── story_details_event.dart
│   │           └── story_details_state.dart
│   │
│   └── reader
│       └── presentation
│           ├── pages
│           │   └── reader_page.dart
│           ├── widgets
│           │   └── text_content.dart
│           └── bloc
│               ├── reader_bloc.dart
│               ├── reader_event.dart
│               └── reader_state.dart
│
├── data
│   ├── repositories
│   │   └── story_repository_impl.dart
│   ├── datasources
│   │   ├── remote
│   │   │   └── story_remote_data_source.dart
│   │   └── local
│   │       └── story_local_data_source.dart
│   └── models
│       ├── story_model.dart
│       └── chapter_model.dart
│
├── domain
│   ├── entities
│   │   ├── story.dart
│   │   └── chapter.dart
│   ├── repositories
│   │   └── story_repository.dart
│   └── usecases
│       ├── get_stories.dart
│       ├── get_story_details.dart
│       └── get_chapter_content.dart
│
└── injection_container.dart