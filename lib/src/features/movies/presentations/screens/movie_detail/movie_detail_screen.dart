import 'package:base_project_riverpod/src/utils/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/image_constants.dart';
import '../../../../../shared_ui/error_widget.dart';
import '../../../../../shared_ui/loading_widget.dart';
import '../../../../../shared_ui/style/theme.dart';
import '../../notifier/movie_detail_notifier.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  final int id;

  const MovieDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final detailNotifier = ref.watch(movieDetailProvider(widget.id));
    return Scaffold(
      body: detailNotifier.when(
        initial: () => const SizedBox(),
        loading: () => const LoadingWidget(),
        success: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeightPercentage(context, percentage: 0.35),
                child: Stack(
                  children: [
                    if (data?.backdropPath != null)
                      Positioned.fill(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: getOriginalImageUrl(data?.backdropPath),
                        ),
                      ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.4),
                                Colors.black.withOpacity(0.7),
                              ]),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      left: 24,
                      top: 56,
                      bottom: 12,
                      right: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.navigate_before,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_outline,
                                    size: 30,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          const Spacer(),
                          Text(
                            data?.title ?? "",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: ThemeConfig.redColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                                "IMDB ${data?.voteAverage?.toStringAsFixed(1) ?? ""}"),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ThemeConfig.redColor,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                                const Text(
                                  "Watch Trailer",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(12.0),
            ],
          );
        },
        error: (error) => ErrorText(
          reload: () {
            ref.read(movieDetailProvider(widget.id).notifier).getMovieDetail();
          },
          error: error,
        ),
      ),
    );
  }
}
