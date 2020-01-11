import 'package:flutter/material.dart';
import 'package:mobx_provider/src/mobx_base/mobx_base.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

///This widget is like default [observer widget] but with
///easier way to bind your stores with the UI
///this widget is extends [stateless Observer widget] which extends [stateless wisget]
///so it's basically a [stateless widget]
///NOTE: hence this is a [stateless widget] it doesn't hold any state , even the state of
///ITS STORE, the store should be SINGLETON and be binded with the widget by injector service
///like provider , get_it ,etc
/// this package is inspired from [Filled Stacks] package [view model provider]
class MobxStatelessObserver<T extends MobxBase>
    extends StatelessObserverWidget {
  final T store;

  final Widget Function(BuildContext context, T store) builder;

  MobxStatelessObserver({
    ///the name of your widget , that's used for debuging purposes only
    ///it's the same as the name parameter in the [observer] widget
    String name,
    Key key,
    @required this.store,
    @required this.builder,
  }) : super(key: key, name: name);
  @override
  Widget build(BuildContext context) => builder(context, store);
}
