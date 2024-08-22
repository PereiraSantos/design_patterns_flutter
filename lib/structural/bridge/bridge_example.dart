import 'package:flutter/material.dart';
import 'package:pattern/structural/bridge/customer.dart';
import 'package:pattern/structural/bridge/customer_repository.dart';
import 'package:pattern/structural/bridge/file_storage.dart';
import 'package:pattern/structural/bridge/order.dart';
import 'package:pattern/structural/bridge/orders_repository.dart';
import 'package:pattern/structural/bridge/repository.dart';
import 'package:pattern/structural/bridge/sql_storage.dart';

class BridgeExample extends StatefulWidget {
  const BridgeExample({super.key});

  @override
  State<BridgeExample> createState() => _BridgeExampleState();
}

class _BridgeExampleState extends State<BridgeExample> {
  final _storage = [SqlStorage(), FileStorage()];

  late IRepository _customersRepository;
  late IRepository _ordersRepository;

  late List<Customer> _customers;
  late List<Order> _orders;

  var _selectedCustomerStorageIndex = 0;
  var _selectedOrderStorageIndex = 0;

  void _selectedCustomerStorageIndexChanged(int? index) {
    if (index == null) return;

    setState(() {
      _selectedCustomerStorageIndex = index;
      _customersRepository = CustomerRepository(_storage[index]);
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _selectedOrderStorageIndexChanged(int? index) {
    if (index == null) return;

    setState(() {
      _selectedOrderStorageIndex = index;
      _ordersRepository = OrdersRepository(_storage[index]);
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  void _addOrder() {
    _ordersRepository.save(Order());

    setState(() => _orders = _ordersRepository.getAll() as List<Order>);
  }

  @override
  void initState() {
    super.initState();

    _customersRepository = CustomerRepository(_storage[_selectedCustomerStorageIndex]);
    _customers = _customersRepository.getAll() as List<Customer>;

    _ordersRepository = OrdersRepository(_storage[_selectedCustomerStorageIndex]);
    _orders = _ordersRepository.getAll() as List<Order>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [Text('Select customer storage')],
          )
        ],
      ),
    ));
  }
}
