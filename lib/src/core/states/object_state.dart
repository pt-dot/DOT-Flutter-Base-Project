import 'package:base_flutter/src/core/data/models/user.dart';

abstract class ObjectState<T> {
  const ObjectState();
}
class ObjectUninitialized<T> extends ObjectState<T> {
  ObjectUninitialized(this.data);
  final T data;
}
class ObjectLoading<T> extends ObjectState<T> {}
class ObjectLoaded<T> extends ObjectState<T> {
  ObjectLoaded(this.data);
  final T data;
}
class ObjectError<T> extends ObjectState<T> {
  ObjectError(this.error);
  final Object error;
}