import 'package:base_project_riverpod/src/features/movies/presentations/screens/main/popular_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../drawer/setting_drawer.dart';
import 'now_playing_movie_screen.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          elevation: 1,
          title: Text(
            "RiverPodMov",
            style: TextStyle(
              color: Theme.of(context).textTheme.displayLarge?.color,
            ),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            isScrollable: true,
            labelColor: Theme.of(context).textTheme.displayLarge?.color,
            tabs: const [
              Tab(
                text: "Popular",
              ),
              Tab(
                text: "Now Playing",
              ),
            ],
          ),
        ),
      ),
      drawer: const SettingDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PopularMovieScreen(),
          NowPlayingMovieScreen(),
        ],
      ),
    );
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }
}
