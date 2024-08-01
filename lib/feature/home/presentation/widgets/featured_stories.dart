import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:story_reader/core/widgets/cached_image_widget.dart';
import 'package:story_reader/data/models/story_model.dart';

class FeaturedStories extends StatelessWidget {
  final List<Story> featuredStories;

  const FeaturedStories({super.key, required this.featuredStories});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: featuredStories.map((story) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  CachedImageWidget(
                    imageUrl: story.coverImage ?? '',
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Center(
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        story.title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
