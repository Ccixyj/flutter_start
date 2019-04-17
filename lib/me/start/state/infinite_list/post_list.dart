import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start/me/start/state/infinite_list/bloc/bloc.dart';
import 'package:flutter_start/me/start/state/infinite_list/models/post.dart';

class PostListBlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PostListBlocDemo"),
      ),
      body: PotListView(),
    );
  }
}

class PotListView extends StatefulWidget {
  @override
  _PotListViewState createState() => _PotListViewState();
}

class _PotListViewState extends State<PotListView> {
  final _postBloc = PostBloc();
  final _controller = ScrollController();
  var loading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
    //init list
    loading = true;
    _postBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(bloc: _postBloc, builder: _buildBloc);
  }

  @override
  void dispose() {
    _postBloc.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBloc(BuildContext context, PostState state) {
    if (state is PostUninitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (state is PostError) {
      return Center(
        child: Text('failed to fetch posts'),
      );
    }

    if (state is PostList) {
      if (state.list.isEmpty) {
        return Center(
          child: Text('failed to fetch posts'),
        );
      }
      loading = false;
      return ListView.builder(
        itemBuilder: (context, index) => index >= state.list.length
            ? BottomLoader()
            : PostWidget(state.list[index]),
        itemCount: state.isFinished ? state.list.length : state.list.length + 1,
        controller: _controller,
      );
    }

    return Text("$state");
  }

  void _onScroll() {
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.position.pixels;
//    debugPrint(
//        "max $maxScroll , curren $currentScroll , gap ${maxScroll - currentScroll}");
    if (maxScroll - currentScroll <= 30 && loading == false) {
      loading = true;
      debugPrint(
          "max $maxScroll , curren $currentScroll , gap ${maxScroll - currentScroll}");
      _postBloc.dispatch(Fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final PostItem item;

  PostWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(item.id.toString()),
      title: Text(item.title),
      subtitle: Text(item.body),
    );
  }
}
