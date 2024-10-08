import 'package:pattern/structural/adapter/xml_contacts_api.dart';
import 'package:pattern/structural/adapter/contact/contact.dart';
import 'package:pattern/structural/adapter/contacts_adpater/json_contact_adapter.dart';
import 'package:xml/xml.dart';

class XmlContactsAdapter implements IContactsAdapter {
  const XmlContactsAdapter({this.api = const XmlContactsApi()});

  final XmlContactsApi api;

  @override
  List<Contact> getContacts() {
    final contactsXml = api.getContactXml();
    final contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    final xmlDocument = XmlDocument.parse(contactsXml);

    final contactsList = <Contact>[];

    for (final xmlElement in xmlDocument.findAllElements('contact')) {
      final fullName = xmlElement.findElements('fullname').single.innerText;
      final email = xmlElement.findElements('email').single.innerText;
      final favouriteString = xmlElement.findElements('favourite').single.innerText;
      final favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(Contact(fullName: fullName, email: email, favourite: favourite));
    }

    return contactsList;
  }
}
