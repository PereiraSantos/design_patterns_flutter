import 'package:flutter/material.dart';
import 'package:pattern/structural/contact/contact.dart';
import 'package:pattern/structural/contacts_adpater/json_contact_adapter.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key, required this.adapter, required this.headerText});

  final IContactsAdapter adapter;
  final String headerText;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final List<Contact> contacts = [];

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.headerText),
          ElevatedButton(onPressed: () => _getContacts(), child: const Text("Get contacts")),
          for (var item in contacts) Text(item.email),
        ],
      ),
    );
  }
}
