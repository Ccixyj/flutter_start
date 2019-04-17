import 'package:flutter_start/me/start/state/infinite_list/bloc/bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class PostRespMock extends Mock implements PostRepository {}

void main() {
  group("PostBloc", () {
    //bloc
    PostBloc bloc;
    PostRespMock resp;
    setUp(() {
      print("set up");
      resp = PostRespMock();
      bloc = PostBloc(repository: resp);
    });

    test("test init state", () {
      assert(bloc != null);
      expect(bloc.initialState, PostUninitialized());
    });

    test(
        "test  emit [PostUninitialized , PostList] when dispatch Fetch 1 and more atonce",
        () {
      //set resp action
      when(resp.fetchPost(0)).thenAnswer((_) => Future.value([]));

      bloc.state.listen((d) {
        print(d);
      });

      //except
      expectLater(
          bloc.state, emitsInOrder([PostUninitialized(), PostList([], false)]));

      //dispatch more
      bloc.dispatch(Fetch());
      bloc.dispatch(Fetch());
      bloc.dispatch(Fetch());
      bloc.dispatch(Fetch());
    });

    test("test  emit [PostUninitialized ,PostError] when dispatch Fetch", () {
      when(resp.fetchPost(0)).thenThrow("test error");

      bloc.state.listen((d) {
        print(d);
      });

      expectLater(bloc.state, emitsInOrder([PostUninitialized(), PostError()]));
      bloc.dispatch(Fetch());
    });

    test("test  emit [] when dispatch FetchSuccess", () {
      expectLater(bloc.state, emitsInOrder([]));
      bloc.dispatch(FetchSuccess());
    });
  });
}
