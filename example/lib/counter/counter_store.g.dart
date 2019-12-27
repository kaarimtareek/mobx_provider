// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on _CounterStore, Store {
  final _$_counterAtom = Atom(name: '_CounterStore._counter');

  @override
  int get _counter {
    _$_counterAtom.context.enforceReadPolicy(_$_counterAtom);
    _$_counterAtom.reportObserved();
    return super._counter;
  }

  @override
  set _counter(int value) {
    _$_counterAtom.context.conditionallyRunInAction(() {
      super._counter = value;
      _$_counterAtom.reportChanged();
    }, _$_counterAtom, name: '${_$_counterAtom.name}_set');
  }

  final _$_CounterStoreActionController =
      ActionController(name: '_CounterStore');

  @override
  void increment() {
    final _$actionInfo = _$_CounterStoreActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CounterStoreActionController.endAction(_$actionInfo);
    }
  }
}
