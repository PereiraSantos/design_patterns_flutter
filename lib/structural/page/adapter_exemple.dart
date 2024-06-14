import 'package:flutter/material.dart';
import 'package:pattern/dashboard/usercases/adapter.dart';

import 'package:pattern/structural/contacts_adpater/json_contact_adapter.dart';
import 'package:pattern/structural/contacts_adpater/xml_contacts_adapter.dart';
import 'package:pattern/structural/page/contact_section.dart';

class AdapterExemple extends StatelessWidget {
  const AdapterExemple({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(const Adapter().title()),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ContactSection(
              adapter: JsonContactsAdapter(),
              headerText: 'Contacts from JSON API',
            ),
            ContactSection(
              adapter: XmlContactsAdapter(),
              headerText: 'Contacts from XML API',
            ),
          ],
        ),
      ),
    );
  }
}
