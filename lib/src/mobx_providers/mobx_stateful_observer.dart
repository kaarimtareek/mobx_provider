import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_provider/src/mobx_base/mobx_base.dart';

///This is like the [Observer stateless Provider] but it contains [Stateful widget]
///instead of [Stateless Widget], this allows you to call a function [initFunction]
/// that you want to be invoked in the [init State]
/// it also preserve the [state of the store] in hot reload
/// when the [current widget] is removed from the widget tree the [StatefulObserverProvider] will
/// call [disopse function] for the store
/// this package is inspired from [Filled Stacks] package [view model provider]
class MobxStatefulObserver<T extends MobxBase> extends StatefulObserverWidget {
  final T store;
  final Widget Function(BuildContext context, T store) builder;
  final void Function(T store) initFunction;

  MobxStatefulObserver({
    ///the name of your widget , that's used for debuging purposes only
    ///it's the same as the name parameter in the [observer] widgets
    String name,
    Key key,
    @required this.store,
    @required this.builder,
    this.initFunction,
  }) : super(key: key, name: name);
  @override
  _MobxStatefulObserverState<T> createState() =>
      _MobxStatefulObserverState<T>();
}

class _MobxStatefulObserverState<T extends MobxBase>
    extends State<MobxStatefulObserver<T>> {
  T _store;
  @override
  void initState() {
    super.initState();
    _store = widget.store;
    if (widget.initFunction != null) widget.initFunction(_store);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _store);
}
