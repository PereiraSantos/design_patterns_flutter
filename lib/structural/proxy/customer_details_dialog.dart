import 'package:flutter/material.dart';
import 'package:pattern/structural/proxy/customer.dart';
import 'package:pattern/structural/proxy/customer_details.dart';
import 'package:pattern/structural/proxy/icustomer_details_service.dart';

class CustomerDetailsDialog extends StatefulWidget {
  const CustomerDetailsDialog({
    super.key,
    required this.customer,
    required this.service,
  });

  final Customer customer;
  final ICustomerDetailsService service;

  @override
  State<CustomerDetailsDialog> createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  @override
  void initState() {
    super.initState();

    widget.service.getCustomerDetails(widget.customer.id).then(
          (CustomerDetails customerDetails) => setState(() {
            widget.customer.details = customerDetails;
          }),
        );
  }

  void _closeDialog() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        height: 200.0,
        child: widget.customer.details == null
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.greenAccent,
                ),
              )
            : Text('${widget.customer.details!}'),
      ),
      actions: [
        Visibility(
          visible: widget.customer.details != null,
          child: TextButton(
            child: const Text('Close'),
            onPressed: () => _closeDialog,
          ),
        )
      ],
    );
  }
}
