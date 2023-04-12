import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared_ui/pagnation_widget.dart';
import '../../../../../utils/ui_helpers.dart';
import '../../notifier/movie_notifier.dart';
import '../../widgets/item_movie.dart';

class PopularMovieScreen extends ConsumerStatefulWidget {
  const PopularMovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NowPlayingMovieScreenState();
}

class _NowPlayingMovieScreenState extends ConsumerState<PopularMovieScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.width * 0.20;
      if (maxScroll - currentScroll <= delta) {
        ref.watch(itemsPopularMovieProvider.notifier).fetchNextBatch();
      }
    });
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: verticalSpace(12.0),
          ),
          ItemMovie(
            stateNotifierProvider: itemsPopularMovieProvider,
            onTap: () {
              ref.watch(itemsPopularMovieProvider.notifier).fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsPopularMovieProvider,
            callback: () =>
                ref.watch(itemsPopularMovieProvider.notifier).noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsPopularMovieProvider,
          ),
        ],
      ),
    );
  }
}
