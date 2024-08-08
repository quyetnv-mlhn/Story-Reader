import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_reader/core/theme/spacing_constants.dart';
import 'package:story_reader/core/utils/string_extensions.dart';
import 'package:story_reader/core/utils/theme_extension.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class SearchStoriesBar extends StatelessWidget {
  final String hintText;
  final Duration debounceTime;

  const SearchStoriesBar({
    super.key,
    this.hintText = 'Search stories...',
    this.debounceTime = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return _SearchStoriesBarContent(
      hintText: hintText.hardCoded,
      debounceTime: debounceTime,
    );
  }
}

class _SearchStoriesBarContent extends StatefulWidget {
  final String hintText;
  final Duration debounceTime;

  const _SearchStoriesBarContent({
    required this.hintText,
    required this.debounceTime,
  });

  @override
  _SearchStoriesBarContentState createState() =>
      _SearchStoriesBarContentState();
}

class _SearchStoriesBarContentState extends State<_SearchStoriesBarContent> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(widget.debounceTime, () {
      context.read<HomeBloc>().add(SearchStories(title: query));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Spacing.radiusS),
        ),
        filled: theme.inputDecorationTheme.filled,
        fillColor: theme.inputDecorationTheme.fillColor,
        contentPadding: Spacing.appEdgePadding,
      ),
      style: theme.textTheme.bodyLarge,
      onChanged: _onSearchChanged,
    );
  }
}
