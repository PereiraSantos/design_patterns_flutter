import 'package:pattern/structural/proxy/customer_details.dart';

abstract interface class ICustomerDetailsService {
  Future<CustomerDetails> getCustomerDetails(String id);
}
