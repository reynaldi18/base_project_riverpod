import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../shared_ui/pagnation_widget.dart';
import '../../../../../utils/ui_helpers.dart';
import '../../notifier/movie_notifier.dart';
import '../../widgets/item_movie.dart';

class NowPlayingMovieScreen extends ConsumerStatefulWidget {
  const NowPlayingMovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NowPlayingMovieScreenState();
}

class _NowPlayingMovieScreenState extends ConsumerState<NowPlayingMovieScreen> {
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
        ref.watch(itemsNowPlayingMovieProvider.notifier).fetchNextBatch();
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
            stateNotifierProvider: itemsNowPlayingMovieProvider,
            onTap: () {
              ref
                  .watch(itemsNowPlayingMovieProvider.notifier)
                  .fetchFirstBatch();
            },
          ),
          NoMoreItems(
            stateNotifierProvider: itemsNowPlayingMovieProvider,
            callback: () =>
                ref.watch(itemsNowPlayingMovieProvider.notifier).noMoreItems,
          ),
          OnGoingBottomWidget(
            stateNotifierProvider: itemsNowPlayingMovieProvider,
          ),
        ],
      ),
    );
  }
}
