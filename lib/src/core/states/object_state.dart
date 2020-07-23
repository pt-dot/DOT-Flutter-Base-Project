/// Global object data state, T = Model class
abstract class ObjectState<T> {
  const ObjectState();
}

/// Object unitialized state
class ObjectUninitialized<T> extends ObjectState<T> {
  ObjectUninitialized(this.data);
  final T data;
}

/// Object loading state
class ObjectLoading<T> extends ObjectState<T> {}

/// Object loaded state
class ObjectLoaded<T> extends ObjectState<T> {
  ObjectLoaded(this.data);
  final T data;
}

/// Object error state
class ObjectError<T> extends ObjectState<T> {
  ObjectError(this.error);
  final Object error;
}
