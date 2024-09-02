import 'package:flutter/material.dart';
import 'package:pattern/structural/proxy/customer.dart';
import 'package:pattern/structural/proxy/customer_details_dialog.dart';
import 'package:pattern/structural/proxy/customer_details_service.dart';
import 'package:pattern/structural/proxy/customer_details_service_proxy.dart';

class ProxyExemple extends StatefulWidget {
  const ProxyExemple({super.key});

  @override
  State<ProxyExemple> createState() => _ProxyExempleState();
}

class _ProxyExempleState extends State<ProxyExemple> {
  final _custumerDetailsServiceProxy = CustomerDetailsServiceProxy(
    const CustomerDetailsService(),
  );
  final _customerList = List.generate(10, (_) => Customer());

  void _showCustomerDetails(Customer customer) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => CustomerDetailsDialog(
          customer: customer,
          service: _custumerDetailsServiceProxy,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('press on the list to seee more information'),
          for (final customer in _customerList)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: Text(
                    customer.name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                trailing: const Icon(Icons.info),
                title: Text(customer.name),
                onTap: () => _showCustomerDetails,
              ),
            )
        ],
      ),
    );
  }
}
