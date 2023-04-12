import 'dart:async';

import 'package:base_project_riverpod/src/network/network_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pagination_state.dart';

class PaginationNotifier<T> extends StateNotifier<PaginationState<T>> {
  PaginationNotifier({
    required this.fetchNextItems,
    required this.itemsPerBatch,
  }) : super(const PaginationState.loading());

  final Future<Either<NetworkExceptions, List<T>>> Function(int page) fetchNextItems;
  final int itemsPerBatch;

  final List<T> _items = [];

  Timer _timer = Timer(const Duration(milliseconds: 0), () {});

  bool noMoreItems = false;
  int page = 1;
  void init() {
    if (_items.isEmpty) {
      fetchFirstBatch();
    }
  }

  void updateData(List<T> result) {
    noMoreItems = result.length < itemsPerBatch;

    if (result.isEmpty) {
      state = PaginationState.data(_items);
    } else {
      state = PaginationState.data(_items..addAll(result));
    }
    page++;
  }

  Future<void> fetchFirstBatch() async {
    try {
      state = const PaginationState.loading();
      final result = await fetchNextItems(page);
      result.fold((l) {
        state = PaginationState.error(l.stringError());
      }, (list) {
        final List<T> result = list;
        updateData(result);
      });
    } catch (e) {
      state = PaginationState.error(e.toString());
    }
  }

  Future<void> fetchNextBatch() async {
    if (_timer.isActive && _items.isNotEmpty) {
      return;
    }
    _timer = Timer(const Duration(milliseconds: 1000), () {});

    if (noMoreItems) {
      return;
    }

    if (state == PaginationState<T>.onGoingLoading(_items)) {
      return;
    }

    state = PaginationState.onGoingLoading(_items);

    await Future.delayed(const Duration(seconds: 1));
    final result = await fetchNextItems(page);
    result.fold((l) {
      state = PaginationState.onGoingError(_items, l.stringError());
    }, (list) {
      updateData(list);
    });
  }
}
