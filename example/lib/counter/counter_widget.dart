import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:mobx_provider/src/mobx_providers/mobx_widget_provider.dart';

import 'counter_store.dart';

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulProvider<CounterStore>(
      initFunction: (store) => store.increment(),
      builder: (context, store) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: store.increment, child: Icon(Icons.add)),
          appBar: AppBar(
            title: Text('mobx provider example'),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MobxWidgetProvider<CounterStore>(
                  builder: (context, store) {
                    return Text('counter value is ${store.counter}');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
