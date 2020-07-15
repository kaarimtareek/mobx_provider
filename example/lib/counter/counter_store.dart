import 'package:mobx/mobx.dart';
import 'package:mobx_provider/mobx_provider.dart';
part 'counter_store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore extends MobxBase with Store {
  _CounterStore() : _counter = 0;
  @observable
  int _counter;

  int get counter => _counter;

  @action
  void increment() => _counter++;

  void dispose() {}
}
