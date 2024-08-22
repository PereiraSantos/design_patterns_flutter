import 'package:pattern/structural/bridge/entity_base.dart';
import 'package:pattern/structural/bridge/storage.dart';

class SqlStorage implements IStorage {
  final Map<Type, List<EntityBase>> sqlStorage = {};

  @override
  List<T> fetchAll<T extends EntityBase>() => sqlStorage.containsKey(T) ? sqlStorage[T]! as List<T> : [];

  @override
  String getTitle() => 'SQL Storage';

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!sqlStorage.containsKey(T)) sqlStorage[T] = <T>[];

    sqlStorage[T]!.add(entityBase);
  }
}
