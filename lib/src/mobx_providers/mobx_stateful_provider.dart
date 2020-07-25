import 'package:flutter/material.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:provider/provider.dart';

///This Widget is integration between [Mobx] and [Provider] package
///specify your [store] in the [provider] and this widget will call [provider.of<T>(context)]
///to get it ,this widget doesn't observe the state of the store ,
///this widget just exposes your store.
///this widget is helpful when you want to get the store's functionality without updating the UI
///like (counter.increment), use this widget with [MobxWidgetProvider] which observes the state of the store
class MobxStatefulProvider<T extends MobxBase> extends StatefulWidget {
  final Widget Function(BuildContext context, T store) builder;

  ///this function is called in the initState , can be used to fetch data from the api
  final void Function(T store) initFunction;

  const MobxStatefulProvider({Key key, this.builder, this.initFunction})
      : super(key: key);
  @override
  _MobxStatefulProviderState<T> createState() =>
      _MobxStatefulProviderState<T>();
}

class _MobxStatefulProviderState<T extends MobxBase>
    extends State<MobxStatefulProvider<T>> {
  T _store;
  @override
  void initState() {
    super.initState();
    _store = context.read<T>();
    if (widget.initFunction != null) widget.initFunction(_store);
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      widget.builder(context, context.select((T store) => store));
}
