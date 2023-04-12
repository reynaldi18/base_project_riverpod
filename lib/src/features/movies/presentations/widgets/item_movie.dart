import 'package:base_project_riverpod/src/utils/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/image_constants.dart';
import '../../../../shared_ui/loading_widget.dart';
import '../../../../utils/navigator_helper.dart';
import '../../domain/entities/movie.dart';
import '../screens/movie_detail/movie_detail_screen.dart';

class ItemMovie extends ConsumerWidget {
  final StateNotifierProvider stateNotifierProvider;
  final VoidCallback onTap;

  const ItemMovie({
    Key? key,
    required this.stateNotifierProvider,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateNotifierProvider);

    return state.when(
      data: (items) {
        return items.isEmpty
            ? SliverToBoxAdapter(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: onTap,
                      icon: const Icon(Icons.replay),
                    ),
                    const Chip(
                      label: Text("No items Found!"),
                    ),
                  ],
                ),
              )
            : ItemsListBuilder(
                items: items,
              );
      },
      loading: () => const SliverToBoxAdapter(
        child: LoadingWidget(),
      ),
      error: (e) => SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: [
              const Icon(Icons.info),
              verticalSpace(20.0),
              Text(
                e,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      onGoingLoading: (items) {
        return ItemsListBuilder(
          items: items,
        );
      },
      onGoingError: (items, e) {
        return ItemsListBuilder(
          items: items,
        );
      },
    );
  }
}

class ItemsListBuilder extends StatelessWidget {
  const ItemsListBuilder({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Movie> items;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GridView.custom(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 12,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: const [
            QuiltedGridTile(5, 2),
            QuiltedGridTile(4, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                NavigatorHelper.push(
                  context,
                  MovieDetailScreen(id: item.id ?? 0),
                );
              },
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: item.backdropPath != null
                          ? CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: getOriginalImageUrl(
                                item.backdropPath,
                              ),
                              errorWidget: ((context, url, error) =>
                                  Image.asset(
                                    ImageConstants.imageNotFound,
                                    fit: BoxFit.cover,
                                  )),
                            )
                          : const SizedBox(),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.5),
                                Colors.black.withOpacity(1),
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Text(
                      item.voteAverage.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: SizedBox(
                      height: 150,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: item.posterPath != null
                            ? CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: getImageUrl(
                                  item.posterPath,
                                ),
                                errorWidget: ((context, url, error) =>
                                    Image.asset(
                                      ImageConstants.imageNotFound,
                                      fit: BoxFit.cover,
                                    )),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}
