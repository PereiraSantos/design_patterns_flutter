import 'package:pattern/structural/proxy/customer_details.dart';

class Customer {
  Customer()
      : id = '1',
        name = 'aa';

  final String id;
  final String name;
  CustomerDetails? details;
}
