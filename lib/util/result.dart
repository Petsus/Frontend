
typedef VoidCallback = void Function();

typedef Callback<T, M> = M Function(T data);
typedef SuccessCallback<T> = void Function(T data);
typedef SuccessCallbackFuture<T> = Future Function(T data);
typedef FailCallback = void Function(dynamic error);

class Result<T> {
  final T? data;
  final dynamic error;

  Result._internal({this.data, this.error});

  factory Result.success({required T value}) =>
      Result<T>._internal(data: value);

  factory Result.error({required dynamic error}) =>
      Result<T>._internal(error: error);

  bool get isSuccessful {
    return error == null;
  }

  bool get isFail {
    return error != null;
  }

  T get get {
    return data!;
  }

  Result<M> mapError<M>() {
    return Result.error(error: error);
  }

  M to<M>(Callback<Result<T>, M> callback) {
    return callback.call(this);
  }

  void success(SuccessCallback<T> callback) {
      if (error == null) {
        callback.call(data as T);
      }
  }

  Future successAsync(SuccessCallbackFuture<T> callback) async {
    if (error == null) {
      await callback.call(data as T);
    }
  }

  void fail(FailCallback callback) {
    if (error != null) {
      callback.call(error);
    }
  }

  void take(SuccessCallback<T> callback, FailCallback failCallback) {
    success(callback);
    fail(failCallback);
  }

  static void multipleResultIsSuccessful(List<Result> results, VoidCallback success, FailCallback failCallback) {
    for (var result in results) {
       if (result.isFail) {
         failCallback(result.error);
         return;
       }
    }
    success();
  }
}

typedef RunCatchingCallback<T> = T Function();
typedef RunCatchingCallbackAsync<T> = Future<T> Function();

Result<T> runCatching<T>(RunCatchingCallback<T> catchingCallback) {
  try {
    final value = catchingCallback.call();
    return Result.success(value: value);
  } catch (e) {
    return Result.error(error: e);
  }
}

Future<Result<T>> runCatchingAsync<T>(RunCatchingCallbackAsync<T> catchingCallback) async {
  try {
    final value = await catchingCallback.call();
    return Result.success(value: value);
  } catch (e) {
    print(e);
    return Result.error(error: e);
  }
}
