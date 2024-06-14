import 'dart:convert';

import 'package:pattern/structural/contact/contact.dart';
import 'package:pattern/structural/adapter/json_contacts_api.dart';

abstract interface class IContactsAdapter {
  List<Contact> getContacts();
}

class JsonContactsAdapter implements IContactsAdapter {
  const JsonContactsAdapter({this.api = const JsonContactsApi()});

  final JsonContactsApi api;

  @override
  List<Contact> getContacts() {
    final contactsJson = api.getContactJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap['contacts'] as List;
    final contactsList = contactsJsonList.map((json) {
      final contactsJson = json;
      return Contact(
          fullName: contactsJson['fullName'] as String,
          email: contactsJson['email'] as String,
          favourite: contactsJson['favourite'] as bool);
    }).toList();

    return contactsList;
  }
}
