import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_start/me/start/state/counter/counter_bloc.dart';

class CounterBlockPage extends StatefulWidget {
  @override
  _CounterBlockPageState createState() => _CounterBlockPageState();
}

class _CounterBlockPageState extends State<CounterBlockPage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("CounterBlockPage"),
        ),
        body: Center(
          child: BlocBuilder<CounterEvent, int>(
              bloc: _counterBloc,
              builder: (_, bloc) {
                return Chip(label: Text(bloc.toString()));
              }),
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () => _counterBloc.dispatch(CounterEvent.increment),
              child: Icon(Icons.add),
              heroTag: null,
            ),
            SizedBox(
              width: 16,
            ),
            FloatingActionButton(
              onPressed: () => _counterBloc.dispatch(CounterEvent.decrement),
              child: Icon(Icons.remove),
              heroTag: null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}
