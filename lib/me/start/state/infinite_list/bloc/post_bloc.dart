import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_start/me/start/state/infinite_list/models/models.dart';
import 'package:http/http.dart' as client;
import 'package:rxdart/rxdart.dart';

import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    print("mapEventToState $event : ${_isFinish(currentState)}");
    if (event is Fetch && !_isFinish(currentState)) {
      //拉取

      try {
        if (currentState is PostUninitialized) {
//          yield PostLoading();
          final posts = await _fetchPost(0);
          yield PostList(posts, false);
          dispatch(FetchSuccess());
          return;
        }

        if (currentState is PostList) {
          final old = currentState as PostList;
//          yield PostLoading();
          final posts = await _fetchPost(old.list.length);

          yield posts.isEmpty
              ? old.copyWith(isFinished: true)
              : PostList(
                  old.list + posts,
                  false,
                );
          dispatch(FetchSuccess());
        }
      } catch (e) {
        print("mapEventToState error $e");
        yield PostError();
      }
    }
  }

  bool _isFinish(PostState state) => state is PostList && state.isFinished;

  Future<List<PostItem>> _fetchPost(int startIndex, {int limit = 5}) async {
    final response = await client.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;
      final list = data.map((rawPost) {
        return PostItem.fromJson(rawPost);
      }).toList();

      return list;
    } else {
      throw Exception('error fetching posts');
    }
  }

  @override
  Stream<PostEvent> transform(Stream<PostEvent> events) =>
      (events as Observable<PostEvent>).distinct();

//  @override
//  Stream<PostState> get state => super.state.where((s) => !(s is PostLoading));
}
