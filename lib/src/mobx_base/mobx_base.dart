import 'package:mobx/mobx.dart';
part 'mobx_base.g.dart';

enum StoreState { loading, sucess, initial, error }

///this is the base class for all mobx classes that need to be attached to the ui.
///it contains some helper states and function that make it easier
///in the ui for determining which widget you should show to the user.
///despite the class has [Store] mixin , you should write [with store] exciplictly
///in your own class in order to generate the code.
abstract class MobxBase = _MobxBase with _$MobxBase;

abstract class _MobxBase with Store {
  _MobxBase() : _state = StoreState.initial;
  @observable
  StoreState _state;

  ///get the state of the store
  StoreState get state => _state;

  bool get isLoading => _state == StoreState.loading;
  bool get isError => _state == StoreState.error;
  bool get isSuccess => _state == StoreState.sucess;
  bool get isInitial => _state == StoreState.initial;
  @action
  void changeState(StoreState state) => _state = state;
  @action
  void toLoadingState() => _state = StoreState.loading;
  @action
  void toSuccessState() => _state = StoreState.sucess;
  @action
  void toErrorState() => _state = StoreState.error;
  @action
  void toInitialState() => _state = StoreState.initial;

  ///this function is called when the [observer stateful provider] is disposed
  void dispose();
}
