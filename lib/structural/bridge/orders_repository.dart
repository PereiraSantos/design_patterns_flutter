import 'package:pattern/structural/bridge/entity_base.dart';
import 'package:pattern/structural/bridge/order.dart';
import 'package:pattern/structural/bridge/repository.dart';
import 'package:pattern/structural/bridge/storage.dart';

class OrdersRepository implements IRepository {
  const OrdersRepository(this.storage);

  final IStorage storage;

  @override
  List<EntityBase> getAll() => storage.fetchAll<Order>();

  @override
  void save(EntityBase entityBase) {
    storage.store<Order>(entityBase as Order);
  }
}
