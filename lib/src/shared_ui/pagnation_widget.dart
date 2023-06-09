import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/ui_helpers.dart';
import 'loading_widget.dart';

class NoMoreItems extends ConsumerWidget {
  final StateNotifierProvider stateNotifierProvider;
  final bool Function() callback;

  const NoMoreItems({
    Key? key,
    required this.stateNotifierProvider,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateNotifierProvider);

    return SliverToBoxAdapter(
      child: state.maybeWhen(
        orElse: () => const SizedBox.shrink(),
        data: (items) {
          bool noMoreItems = callback();
          return noMoreItems
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "No More Items Found!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge?.color),
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

class OnGoingBottomWidget extends StatelessWidget {
  final StateNotifierProvider stateNotifierProvider;

  const OnGoingBottomWidget({Key? key, required this.stateNotifierProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(40),
      sliver: SliverToBoxAdapter(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(stateNotifierProvider);
          return state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            onGoingLoading: (items) => const LoadingWidget(),
            onGoingError: (items, e) => Center(
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
          );
        }),
      ),
    );
  }
}
