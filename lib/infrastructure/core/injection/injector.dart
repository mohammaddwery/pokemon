import 'dart:async';

typedef AsyncFunc<T> = Future<T> Function();
typedef DisposableFunc<T> = FutureOr Function(T param);

abstract class Injector {
  void registerLazySingleton<T extends Object>(T Function() function);

  Future<void> registerSingletonAsync<T extends Object>(
    AsyncFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  });

  void registerSingleton<T extends Object>(T instance);

  void registerFactory<T extends Object>(T Function() function, {String? instanceName});

  void registerFactoryParam<T extends Object>(T Function(dynamic param1, dynamic param2) function, {String? instanceName});

  T get<T extends Object>({String? instanceName, dynamic param1, dynamic param2});

  void unregister<T extends Object>();
}
