import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_start/me/start/page/mdc_list_demo.dart';
import 'package:flutter_start/me/start/state/counter/counter_bloc_page.dart';

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
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print("$error : $stacktrace");
  }
}
