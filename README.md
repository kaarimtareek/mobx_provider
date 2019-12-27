# mobx_provider

Additional package for [Mobx](https://pub.dev/packages/mobx),
it allows you to bind your (viewmodels) mobx stores with UI
more easily
the package is inspired by filled stacks pattern [view model provider].

## Getting Started
NOTE : if you are not familiar with [Mobx](https://pub.dev/packages/mobx), take a look 
on it to see how you can use this package.
**1 - create you own store and make it extends `MobxBase` class and write your own logic**

```dart
class CounterStore = _CounterStore with _$CounterStore;
abstract class _CounterStore extends MobxBase with Store {

  
  _CounterStore():_counter=0;
  @observable
  int _counter;

  int get counter => _counter;

  @action
  void increment() => _counter++;
  @override
  void dispose() {}
}
 ```
 **NOTE**:
 - the class `MobxBase` contains a `dispose` function which should be implemented in your store .
 - additionally, it has some helper functions and states which indicates the state of your store whether it's  `loading` ,`error` ,`initial`,`success`.


**2- bind your logic with the UI like this**

```dart 
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulProvider<CounterStore>(
      store: CounterStore(),
      builder: (context, store) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: store.increment,
          ),
          appBar: AppBar(
            title: Text('mobx provider example'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Text('counter value is ${store.counter}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
```
- `MobxStatefulProvider` is a stateful widget that takes a generic type which extends `MobxBase` .
- it contains `initFunction` that's called in `initState` if you wanted to run some code when the widget is rendered for the first time
- it'll call the dispose function when the widget it removed from the widget tree.

 
