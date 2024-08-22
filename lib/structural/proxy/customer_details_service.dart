import 'package:pattern/structural/proxy/customer_details.dart';
import 'package:pattern/structural/proxy/icustomer_details_service.dart';

class CustomerDetailsService implements ICustomerDetailsService {
  const CustomerDetailsService();

  @override
  Future<CustomerDetails> getCustomerDetails(String id) => Future.delayed(
        const Duration(seconds: 2),
        () => CustomerDetails(customerId: id, email: 'aaa', hobby: 'bbb', position: '11'),
      );
}
