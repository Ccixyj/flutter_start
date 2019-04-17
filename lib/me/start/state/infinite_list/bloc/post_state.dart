import 'package:equatable/equatable.dart';
import 'package:flutter_start/me/start/state/infinite_list/models/models.dart';

abstract class PostState extends Equatable {
  PostState([List props = const []]) : super(props);
}

class PostUninitialized extends PostState {
  @override
  String toString() => 'PostUninitialized';
}

class PostError extends PostState {
  @override
  String toString() => 'PostError';
}

class PostList extends PostState {
  final List<PostItem> list;
  final bool isFinished;

  PostList(this.list, this.isFinished) : super([list, isFinished]);

  @override
  String toString() {
    return 'PostList{list: ${list.length}, isFinished: $isFinished}';
  }

  PostList copyWith({List<PostItem> list, bool isFinished}) {
    return PostList(list ?? this.list, isFinished ?? this.isFinished);
  }
}
