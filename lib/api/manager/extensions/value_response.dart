
class ValueResponse<T> {
  final bool _isSuccessful;
  final T? _value;

  ValueResponse(this._isSuccessful, this._value);

  T get data => _value!;

  bool get isSuccessful => _isSuccessful;
}