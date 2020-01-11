# mobx_provider

Additional package for [Mobx](https://pub.dev/packages/mobx),
it allows you to bind your (viewmodels) mobx stores with UI
more easily
the package is inspired by filled stacks pattern [view model provider].

## Getting Started
NOTE : if you are not familiar with [Mobx](https://pub.dev/packages/mobx), take a look 
on it to see how you can use this package.

**Breaking Changes**
- in older versions  (before 0.0.2) `MobxStatefulProvider` now changed to `MobxStatefulObserver` and 
`MobxStatelessProvider` now changed to `MobxStatelessObserver` with the same functionalities
- in the new version (0.0.2) the `MobxStatefulProvider` widget is integration between `Mobx` and `Provider` package 
it contains `Provider.of<T>(context)` where `T` extends `MobxBase` , this widget exposes only the value of the store wihtout observing it
- `MobxWidgetProvider` uses also `Provider` to get the value of the store and observe it in specific widget (see the example to have a better understanding)


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
    return MobxStatefulObserver<CounterStore>(
      store: CounterStore(),
      initFunction:(store){
        //do api calls here
        //store.fetchData();
      }
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
- `MobxStatefulObserver` is a stateful widget that takes a generic type which extends `MobxBase` .
- it contains `initFunction` that's called in `initState` if you wanted to run some code when the widget is rendered for the first time
- it'll call the dispose function when the widget it removed from the widget tree.

**If you want to have more optimization when rendring the widget tree**
- you can use `MobxStatefulProvider` which exposes only the `store` from the `provider` package (donsn't observe any state)
- use `MobxWidgetProvider` to observe the state of the `store` and only this widget will be rendered when the store changes


```dart 
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobxStatefulProviderr<CounterStore>(
      initFunction: (store){
        //do api calls here
        //store.fetchData();
      }
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
               MobxWidgetProvider<CounterStore>(
                  builder:(context,store){
                    //this widget will only be rendered when the value changes
                    return Text('counter value is ${store.counter}');
                  }
               ) 
              ],
            ),
          ),
        );
      },
    );
  }
}
```


if you have any suggestions or improvments please let me know .
 
