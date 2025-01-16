import 'package:objectbox/objectbox.dart';

class ObjectboxProvider<T> {
  final Box<T> _box;

  ObjectboxProvider(Store store) : _box = store.box();

  Future<int> insert(T entity) async {
    return await _box.putAsync(entity, mode: PutMode.insert);
  }

  Future<int> update(T entity) async {
    return await _box.putAsync(entity, mode: PutMode.update);
  }

  Future<T?> get(int id) async {
    return await _box.getAsync(id);
  }

  Future<List<T>> getAll() async {
    return await _box.getAllAsync();
  }

  Future<bool> remove(int id) async {
    return await _box.removeAsync(id);
  }
}
