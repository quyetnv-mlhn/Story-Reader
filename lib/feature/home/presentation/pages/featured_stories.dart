import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:story_reader/core/widgets/cached_image_widget.dart';
import 'package:story_reader/data/models/response/story_model.dart';

import 'package:story_reader/core/theme/spacing_constants.dart';

class FeaturedStories extends StatelessWidget {
  final List<Story> featuredStories;

  const FeaturedStories({super.key, required this.featuredStories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
      items: featuredStories.map((story) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: Spacing.appEdgePadding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Spacing.radiusL),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.radiusL),
                child: Stack(
                  children: [
                    CachedImageWidget(
                      imageUrl: story.coverImage ?? '',
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            theme.colorScheme.primary.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: Spacing.paddingAllM,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            story.title ?? '',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacing.verticalSpaceS,
                          Text(
                            story.author ?? '',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}