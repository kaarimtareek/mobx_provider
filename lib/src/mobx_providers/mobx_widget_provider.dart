import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
import 'package:provider/provider.dart';

///this widget is used to get the [store] from the [provider] and observe its state
///use this widget only when you want to render specific widget,shouldn't be used to build a whole page
///that's why it doens't have an [initFunction]
class MobxWidgetProvider<T extends MobxBase> extends StatelessObserverWidget {
  final Widget Function(BuildContext context, T store) builder;
  MobxWidgetProvider({
    @required this.builder,
  });
  @override
  Widget build(BuildContext context) => builder(context, context.read()<T>());
}
