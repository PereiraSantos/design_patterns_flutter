import 'package:pattern/structural/bridge/customer.dart';
import 'package:pattern/structural/bridge/entity_base.dart';
import 'package:pattern/structural/bridge/repository.dart';
import 'package:pattern/structural/bridge/storage.dart';

class CustomerRepository implements IRepository {
  const CustomerRepository(this.storage);

  final IStorage storage;

  @override
  List<EntityBase> getAll() => storage.fetchAll<Customer>();

  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase as Customer);
  }
}
