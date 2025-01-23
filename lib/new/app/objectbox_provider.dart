import 'package:objectbox/objectbox.dart';

class ObjectboxProvider<T> {
  final Box<T> _box;

  ObjectboxProvider(this._box);

  Future<List<T>> getAll() async {
    return await _box.getAllAsync();
  }

  Future<List<int>> insertMany(List<T> entities) async {
    return await _box.putManyAsync(entities, mode: PutMode.insert);
  }

  Future<int> update(T entity) async {
    return await _box.putAsync(entity, mode: PutMode.update);
  }

  Stream<List<T>> stream([Condition<T>? condition]) {
    return _box.query(condition).watch(triggerImmediately: true).map((query) {
      return query.find();
    });
  }
}
