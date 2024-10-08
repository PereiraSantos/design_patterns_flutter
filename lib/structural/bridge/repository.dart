import 'package:pattern/structural/bridge/entity_base.dart';

abstract interface class IRepository {
  List<EntityBase> getAll();
  void save(EntityBase entityBase);
}
