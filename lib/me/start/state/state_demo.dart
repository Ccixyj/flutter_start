import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/page/mdc_list_demo.dart';
import 'package:flutter_start/me/start/state/counter/counter_bloc_page.dart';
import 'package:flutter_start/me/start/state/infinite_list/post_list.dart';

class StateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Demo"),
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "counter page",
            page: CounterBlockPage(),
          ),
          ListItem(
            title: "inifinte post list",
            page: PostListBlocDemo(),
          )
        ],
      ),
    );
  }

  StateDemo() {
    BlocSupervisor().delegate = LogBlocDelegate();
  }
}

class LogBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print("event $transition");
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print("error occured => $error");
  }
}
